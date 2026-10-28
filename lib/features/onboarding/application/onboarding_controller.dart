import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../profile/data/drift_profile_repository.dart';
import '../../profile/domain/user_profile.dart';

part 'onboarding_controller.g.dart';

/// Holds the profile being filled in during onboarding; saved once at the end.
@riverpod
class OnboardingController extends _$OnboardingController {
  @override
  Future<UserProfile> build() => ref.watch(profileRepositoryProvider).get();

  void edit(UserProfile Function(UserProfile p) change) {
    final current = state.value;
    if (current != null) state = AsyncData(change(current));
  }

  /// Persists the answers; the router then leaves onboarding automatically.
  Future<void> finish() async {
    final current = state.value;
    if (current == null) return;
    await ref.read(profileRepositoryProvider).save(current.copyWith(onboardingComplete: true));
  }
}
