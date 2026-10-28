import 'package:geolocator/geolocator.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'platform_capabilities.dart';
import 'platform_providers.dart';

part 'permissions_service.g.dart';

enum AppPermission { health, motion, location, notifications }

enum PermissionResult { granted, denied, permanentlyDenied, unavailable }

@Riverpod(keepAlive: true)
PermissionsService permissionsService(Ref ref) => PermissionsService(ref.watch(platformCapabilitiesProvider));

/// Runtime permissions, each requested through the plugin that owns it.
/// Every failure (missing capability, unsupported device) maps to
/// [PermissionResult.unavailable] instead of throwing.
class PermissionsService {
  PermissionsService(this._caps);

  final PlatformCapabilities _caps;

  /// Health data PULSE reads (workouts are also written back).
  List<HealthDataType> get healthReadTypes => [
        HealthDataType.STEPS,
        HealthDataType.ACTIVE_ENERGY_BURNED,
        HealthDataType.HEART_RATE,
        HealthDataType.RESTING_HEART_RATE,
        HealthDataType.FLIGHTS_CLIMBED,
        if (_caps.isIOS) ...[
          HealthDataType.DISTANCE_WALKING_RUNNING,
          HealthDataType.HEART_RATE_VARIABILITY_SDNN,
          HealthDataType.SLEEP_ASLEEP,
        ] else ...[
          HealthDataType.DISTANCE_DELTA,
          HealthDataType.HEART_RATE_VARIABILITY_RMSSD,
          HealthDataType.SLEEP_SESSION,
        ],
      ];

  /// Permissions that make sense on this device (none on desktop).
  List<AppPermission> get applicable => _caps.isMobile ? AppPermission.values : const [];

  Future<PermissionResult> request(AppPermission permission) async {
    if (!_caps.isMobile) return PermissionResult.unavailable;
    try {
      return switch (permission) {
        AppPermission.health => await _requestHealth(),
        AppPermission.motion =>
          _map(await (_caps.isAndroid ? Permission.activityRecognition : Permission.sensors).request()),
        AppPermission.location => await _requestLocation(),
        AppPermission.notifications => _map(await Permission.notification.request()),
      };
    } catch (_) {
      return PermissionResult.unavailable;
    }
  }

  Future<bool> openSettings() => openAppSettings();

  Future<PermissionResult> _requestHealth() async {
    final health = Health();
    await health.configure();
    if (_caps.isAndroid && !await health.isHealthConnectAvailable()) return PermissionResult.unavailable;
    final types = [...healthReadTypes, HealthDataType.WORKOUT];
    final access = [for (final t in types) t == HealthDataType.WORKOUT ? HealthDataAccess.READ_WRITE : HealthDataAccess.READ];
    return await health.requestAuthorization(types, permissions: access) ? PermissionResult.granted : PermissionResult.denied;
  }

  Future<PermissionResult> _requestLocation() async => switch (await Geolocator.requestPermission()) {
        LocationPermission.always || LocationPermission.whileInUse => PermissionResult.granted,
        LocationPermission.deniedForever => PermissionResult.permanentlyDenied,
        LocationPermission.unableToDetermine => PermissionResult.unavailable,
        LocationPermission.denied => PermissionResult.denied,
      };

  static PermissionResult _map(PermissionStatus s) {
    if (s.isGranted || s.isLimited || s.isProvisional) return PermissionResult.granted;
    if (s.isPermanentlyDenied) return PermissionResult.permanentlyDenied;
    if (s.isRestricted) return PermissionResult.unavailable;
    return PermissionResult.denied;
  }
}
