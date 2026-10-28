import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/domain/pulse_enums.dart';
import '../features/profile/data/drift_profile_repository.dart';

part 'theme_mode_controller.g.dart';

/// App-wide theme mode, persisted on the user profile. Dark-first: dark is
/// used until the profile has loaded.
@Riverpod(keepAlive: true)
class ThemeModeController extends _$ThemeModeController {
  @override
  ThemeMode build() => switch (ref.watch(userProfileProvider).value?.themeMode ?? AppThemeMode.dark) {
        AppThemeMode.dark => ThemeMode.dark,
        AppThemeMode.light => ThemeMode.light,
        AppThemeMode.system => ThemeMode.system,
      };

  Future<void> set(ThemeMode mode) async {
    state = mode; // apply instantly; the save below confirms it via the profile stream
    final repo = ref.read(profileRepositoryProvider);
    final profile = await repo.get();
    await repo.save(profile.copyWith(
      themeMode: switch (mode) {
        ThemeMode.dark => AppThemeMode.dark,
        ThemeMode.light => AppThemeMode.light,
        ThemeMode.system => AppThemeMode.system,
      },
    ));
  }
}
