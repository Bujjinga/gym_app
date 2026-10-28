import '../../activity/domain/day_activity.dart';

/// How hard to train today, from the recovery score.
enum Readiness { ready, light, rest }

/// Advice the coach can give; the UI turns each into localized text.
enum CoachTip { sleepMore, hrvLow, restingHrHigh, loadSpike, deload, connectHealth }

/// One finished training session (strength or cardio).
typedef TrainingLoad = ({DateTime startedAt, int minutes});

/// Everything the coach looks at.
class CoachInput {
  const CoachInput({required this.now, required this.days, required this.training});

  final DateTime now;

  /// Daily activity rows for about the last 4 weeks, oldest first.
  final List<DayActivity> days;

  /// Finished sessions from about the last 5 weeks.
  final List<TrainingLoad> training;
}

class CoachReport {
  const CoachReport({this.recoveryScore, this.readiness, this.tips = const []});

  /// 0–100, or null when there's no sleep/HRV/heart-rate data to judge by.
  final int? recoveryScore;
  final Readiness? readiness;

  /// Most important first.
  final List<CoachTip> tips;
}

/// Coaching logic behind an interface, so an AI/LLM coach can replace the
/// on-device rules later without touching the UI.
abstract interface class CoachService {
  Future<CoachReport> report(CoachInput input);
}
