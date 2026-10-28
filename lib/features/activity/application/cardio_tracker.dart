import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:pedometer/pedometer.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../../core/domain/pulse_enums.dart';
import '../../../core/platform/platform_providers.dart';
import '../../../core/utils/cardio_calculations.dart';
import '../../../core/utils/geo.dart';
import '../../../core/utils/ids.dart';
import '../../../core/utils/unit_conversion.dart';
import '../../achievements/application/achievement_engine.dart';
import '../../achievements/domain/achievement_catalog.dart';
import '../../health/data/health_sync_service.dart';
import '../../profile/data/drift_profile_repository.dart';
import '../data/drift_activity_repository.dart';
import '../domain/cardio_session.dart';
import '../domain/route_point.dart';
import 'step_counter_service.dart';

part 'cardio_tracker.freezed.dart';
part 'cardio_tracker.g.dart';

enum TrackingStatus { running, paused, autoPaused }

@freezed
abstract class TrackingState with _$TrackingState {
  const factory TrackingState({
    required String sessionId,
    required CardioType type,
    required bool indoor,
    required DateTime startedAt,
    @Default(TrackingStatus.running) TrackingStatus status,
    @Default(0) int movingSeconds,
    @Default(0) double distanceM,
    @Default(0) double elevationGainM,
    @Default(0) int steps,
    @Default(<LatLng>[]) List<LatLng> route,
    @Default(<Duration>[]) List<Duration> splits,
    @Default(true) bool audioCues,
  }) = _TrackingState;
}

/// Spoken split cue, built by the UI so it is localized.
typedef SplitPhrase = String Function(int units, Duration pace);

/// Live GPS (outdoor) or step-based (indoor) cardio tracking. Phones only.
@Riverpod(keepAlive: true)
class CardioTracker extends _$CardioTracker {
  StreamSubscription<Position>? _gps;
  StreamSubscription<StepCount>? _pedometer;
  Timer? _tick;
  final _auto = AutoPause();
  final _buffer = <RoutePoint>[];
  final _altitudes = <double?>[];
  Position? _last;
  int? _stepBase;
  int _splitStartSeconds = 0;
  double _stride = 0.75;
  DistanceUnit _unit = DistanceUnit.km;
  SplitPhrase? _phrase;
  final _tts = FlutterTts();
  bool _starting = false;

  @override
  TrackingState? build() {
    ref.onDispose(_stopStreams);
    return null;
  }

  /// Returns false when outdoor tracking can't get location permission.
  Future<bool> start(
    CardioType type, {
    required bool indoor,
    required String notificationTitle,
    required String notificationText,
    required SplitPhrase phrase,
  }) async {
    if (state != null || _starting) return true;
    _starting = true; // a second tap while permission/profile load must not start a second tracker
    try {
      return await _start(type,
          indoor: indoor, notificationTitle: notificationTitle, notificationText: notificationText, phrase: phrase);
    } finally {
      _starting = false;
    }
  }

  Future<bool> _start(
    CardioType type, {
    required bool indoor,
    required String notificationTitle,
    required String notificationText,
    required SplitPhrase phrase,
  }) async {
    if (!indoor) {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.always && permission != LocationPermission.whileInUse) return false;
    }
    final profile = await ref.read(profileRepositoryProvider).get();
    _stride = StepCounterService.strideMeters(profile.heightCm) * (type == CardioType.run ? 1.3 : 1);
    _unit = profile.distanceUnit;
    _phrase = phrase;
    final session = TrackingState(sessionId: newId(), type: type, indoor: indoor, startedAt: DateTime.now());
    state = session;
    await ref.read(activityRepositoryProvider).saveCardio(_toSession(session));
    await WakelockPlus.enable();

    _tick = Timer.periodic(const Duration(seconds: 1), (_) {
      final s = state;
      if (s != null && s.status == TrackingStatus.running) state = s.copyWith(movingSeconds: s.movingSeconds + 1);
    });
    if (indoor) {
      _pedometer = Pedometer.stepCountStream.listen(_onSteps, onError: (Object _) {});
    } else {
      _gps = Geolocator.getPositionStream(locationSettings: _settings(notificationTitle, notificationText))
          .listen(_onPosition, onError: (Object _) {});
    }
    return true;
  }

  LocationSettings _settings(String title, String text) {
    final caps = ref.read(platformCapabilitiesProvider);
    if (caps.isAndroid) {
      // Foreground service keeps tracking alive with the screen off.
      return AndroidSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 3,
        intervalDuration: const Duration(seconds: 2),
        foregroundNotificationConfig: ForegroundNotificationConfig(
          notificationTitle: title,
          notificationText: text,
          enableWakeLock: true,
          setOngoing: true,
        ),
      );
    }
    return AppleSettings(
      accuracy: LocationAccuracy.best,
      activityType: ActivityType.fitness,
      distanceFilter: 3,
      pauseLocationUpdatesAutomatically: false,
      allowBackgroundLocationUpdates: true,
      showBackgroundLocationIndicator: true,
    );
  }

  void _onPosition(Position p) {
    final s = state;
    if (s == null || p.accuracy > 30) return; // drop poor fixes
    final last = _last;
    final step = last == null ? 0.0 : Geo.distanceM(last.latitude, last.longitude, p.latitude, p.longitude);
    final dt = last == null ? 1 : p.timestamp.difference(last.timestamp).inMilliseconds / 1000;
    final speed = p.speed > 0 ? p.speed : (dt > 0 ? step / dt : 0.0);
    // Spike filter: faster than 15 m/s on foot (40 m/s cycling) is GPS noise.
    if (last != null && speed > (s.type == CardioType.cycle ? 40 : 15)) return;
    _last = p;

    var status = s.status;
    if (status != TrackingStatus.paused) {
      status = _auto.update(speed, p.timestamp) ? TrackingStatus.autoPaused : TrackingStatus.running;
    }
    if (status != TrackingStatus.running) {
      state = s.copyWith(status: status);
      return;
    }
    _altitudes.add(p.altitude == 0 ? null : p.altitude);
    _buffer.add(RoutePoint(
      id: newId(),
      recordedAt: p.timestamp,
      latitude: p.latitude,
      longitude: p.longitude,
      altitudeM: p.altitude,
      speedMps: speed,
      accuracyM: p.accuracy,
    ));
    if (_buffer.length >= 10) _flushPoints();
    _advance(
      s.copyWith(
        status: status,
        distanceM: s.distanceM + step,
        elevationGainM: Geo.elevationGain(_altitudes),
        route: [...s.route, LatLng(p.latitude, p.longitude)],
      ),
    );
  }

  void _onSteps(StepCount event) {
    final s = state;
    if (s == null) return;
    _stepBase ??= event.steps - s.steps;
    final steps = event.steps - _stepBase!;
    if (s.status != TrackingStatus.running) {
      _stepBase = event.steps - s.steps; // steps while paused don't count
      return;
    }
    _advance(s.copyWith(steps: steps, distanceM: steps * _stride));
  }

  /// Applies new progress and announces/records completed splits.
  void _advance(TrackingState next) {
    final unitM = Units.metersPerUnit(_unit);
    final units = (next.distanceM / unitM).floor();
    if (units > next.splits.length) {
      final split = Duration(seconds: next.movingSeconds - _splitStartSeconds);
      _splitStartSeconds = next.movingSeconds;
      next = next.copyWith(splits: [...next.splits, split]);
      if (next.audioCues && _phrase != null) _tts.speak(_phrase!(units, split));
    }
    state = next;
  }

  void pause() {
    final s = state;
    if (s != null) state = s.copyWith(status: TrackingStatus.paused);
  }

  void resume() {
    final s = state;
    if (s == null) return;
    _auto.paused = false;
    state = s.copyWith(status: TrackingStatus.running);
  }

  void setAudioCues(bool on) {
    final s = state;
    if (s != null) state = s.copyWith(audioCues: on);
  }

  /// Saves the session and returns its id.
  Future<String?> finish() async {
    final s = state;
    if (s == null) return null;
    _stopStreams();
    await _flushPoints();
    final weight = (await ref.read(profileRepositoryProvider).get()).weightKg;
    final session = _toSession(s).copyWith(
      endedAt: DateTime.now(),
      caloriesKcal: Cardio.sessionCalories(
        type: s.indoor ? CardioType.treadmill : s.type,
        distanceM: s.distanceM,
        durationSec: s.movingSeconds,
        weightKg: weight,
      ),
    );
    await ref.read(activityRepositoryProvider).saveCardio(session);
    unawaited(ref.read(healthSyncProvider).saveWorkout(
          cardioType: session.type,
          start: session.startedAt,
          end: session.endedAt!,
          kcal: session.caloriesKcal,
          distanceM: session.distanceM,
        ));
    unawaited(ref.read(achievementEngineProvider).award(xp: XpRewards.cardio(distanceM: session.distanceM)));
    state = null;
    return session.id;
  }

  Future<void> discard() async {
    final s = state;
    _stopStreams();
    _buffer.clear();
    if (s != null) await ref.read(activityRepositoryProvider).deleteCardio(s.sessionId);
    state = null;
  }

  CardioSession _toSession(TrackingState s) => CardioSession(
        id: s.sessionId,
        type: s.indoor && (s.type == CardioType.run || s.type == CardioType.walk) ? CardioType.treadmill : s.type,
        source: s.indoor ? CardioSource.indoor : CardioSource.gps,
        startedAt: s.startedAt,
        durationSec: s.movingSeconds,
        distanceM: s.distanceM,
        elevationGainM: s.indoor ? null : s.elevationGainM,
        steps: s.indoor ? s.steps : null,
      );

  Future<void> _flushPoints() async {
    final s = state;
    if (s == null || _buffer.isEmpty) return;
    final batch = List.of(_buffer);
    _buffer.clear();
    await ref.read(activityRepositoryProvider).addRoutePoints(s.sessionId, batch);
  }

  void _stopStreams() {
    _gps?.cancel();
    _pedometer?.cancel();
    _tick?.cancel();
    _gps = null;
    _pedometer = null;
    _tick = null;
    _last = null;
    _stepBase = null;
    _splitStartSeconds = 0;
    _altitudes.clear();
    _auto.paused = false;
    WakelockPlus.disable();
  }
}
