import 'dart:ui';

import 'gen/app_localizations.dart';

/// Strings for text built outside the widget tree (notifications, Live
/// Activities), in the device language or English if it isn't supported.
AppLocalizations systemL10n() {
  try {
    return lookupAppLocalizations(PlatformDispatcher.instance.locale);
  } catch (_) {
    return lookupAppLocalizations(const Locale('en'));
  }
}
