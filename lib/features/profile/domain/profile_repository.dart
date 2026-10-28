import 'user_profile.dart';

/// Access to the single local user profile. Implementations create a default
/// profile on first access, so callers never see "no profile".
abstract interface class ProfileRepository {
  Stream<UserProfile> watch();

  Future<UserProfile> get();

  Future<void> save(UserProfile profile);
}
