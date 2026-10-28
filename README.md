# PULSE

Premium gym & activity tracker — one Flutter codebase for iOS, Android, macOS and Windows.

## Requirements

- Flutter 3.47+ (stable), Dart 3.13+
- iOS / macOS: Xcode 27+, CocoaPods
- Android: Android SDK 36, accept licenses with `flutter doctor --android-licenses`
- Windows: Visual Studio 2022 with the **Desktop development with C++** workload

## First run

```bash
flutter pub get                      # also runs gen-l10n (generate: true)
dart run build_runner build          # Riverpod, go_router, freezed, drift codegen
flutter run -d <device>              # e.g. -d macos, -d windows, or a phone id
```

Use `dart run build_runner watch` while developing.

## Run per platform

| Platform | Command |
|----------|---------|
| iPhone   | `flutter run -d <iphone-id>` (simulator: open Xcode › Settings › Components to install an iOS runtime) |
| Android  | `flutter run -d <android-id>` |
| macOS    | `flutter run -d macos` |
| Windows  | `flutter run -d windows` (must be run on a Windows machine) |

## Tests

```bash
flutter test                                   # unit + widget + golden
flutter test --update-goldens test/core        # regenerate goldens after intended UI changes
```

Goldens are rendered with the test font and can differ slightly between OSes; regenerate them on the
machine (or CI image) that runs them.

## Project layout

```
lib/
  app/                 app widget, typed go_router routes, adaptive shell, sidebar
  core/
    design_system/     tokens, theme, widgets, animations, shaders (single import: design_system.dart)
    platform/          PlatformCapabilities, haptics, desktop window setup
    utils/             pure calculations (HR zones, …)
    database/ sync/    (Phase 2 / Phase 8)
  features/<feature>/{data,domain,application,presentation}
  l10n/                ARB strings (app_en.arb); generated code in l10n/gen
shaders/               fragment shaders registered in pubspec.yaml
assets/                rive/, lottie/, images/, seed/
```

The **component gallery** (Profile › Developer › Component gallery, debug builds only) shows every
design-system component and signature animation with mock data.

## Platform setup (Phase 1)

- **macOS** — `com.apple.security.network.client` added to `macos/Runner/DebugProfile.entitlements`
  and `Release.entitlements` (fonts and map tiles). Window: 1280×820 default, 900×600 minimum
  (`lib/core/platform/desktop_window.dart`).
- **Android** — `android/app/build.gradle.kts`: `minSdk = 26` (Health Connect), `compileSdk = 37`, core library
  desugaring enabled (required by `flutter_local_notifications`). `AndroidManifest.xml`: `INTERNET`,
  `VIBRATE`, app label `PULSE`.
- **iOS** — `CFBundleDisplayName` = `PULSE`.
- **Windows** — no changes needed yet; window size/min size come from `window_manager` at runtime.

Health, location, background modes, widgets, Live Activities and notification permissions are added in
the phases that use them, with exact steps.

## Permissions & health (Phase 3)

Already configured in the repo:
- **iOS** `Info.plist`: Health (read/update), Motion, Location (when in use + always), Camera, Photos usage
  strings. `ios/Podfile` enables `PERMISSION_SENSORS` and `PERMISSION_NOTIFICATIONS` for permission_handler.
- **Android** `AndroidManifest.xml`: `ACTIVITY_RECOGNITION`, fine/coarse location, `POST_NOTIFICATIONS`,
  Health Connect read permissions (steps, distance, active calories, heart rate, resting HR, HRV, sleep,
  floors), the Health Connect rationale intent filter and package query. `MainActivity` extends
  `FlutterFragmentActivity` (required by the health package). `compileSdk = 37`, `minSdk = 26`.

Manual step (Xcode, cannot be scripted safely): open `ios/Runner.xcworkspace` › *Runner* target ›
*Signing & Capabilities* › **+ Capability › HealthKit**. Without it the Health permission card shows
"Not available on this device" instead of the system prompt.

On Android the Health card needs the Health Connect app (built in on Android 14+).

## Walks, runs & steps (Phase 5)

Phones only (desktop shows synced history and supports manual entry):
- **Android** `AndroidManifest.xml`: `ACCESS_BACKGROUND_LOCATION`, `FOREGROUND_SERVICE`,
  `FOREGROUND_SERVICE_LOCATION`, `WAKE_LOCK` and a `TTS_SERVICE` query for audio cues. Background
  tracking runs as a location foreground service with a persistent notification (geolocator).
- **iOS** `Info.plist`: `UIBackgroundModes` = `location`, `processing`. In Xcode also tick
  *Signing & Capabilities › Background Modes › Location updates* (it mirrors this key).
- Step counting starts automatically once Motion & fitness access is granted.
- Maps use public OpenStreetMap tiles (`lib/features/activity/presentation/widgets/route_map.dart`);
  switch to a keyed tile provider before release, per the OSM tile usage policy.

## Health & body (Phase 6)

- **Health sync** (phones): the last 7 days of steps, distance, floors, active calories, heart rate,
  resting HR, HRV and sleep are imported into `daily_activity` on launch and from Progress › Sync.
  Finished workouts and walks/runs are written back as workouts. Android adds
  `health.WRITE_EXERCISE` / `READ_EXERCISE`. VO2 max is not exposed by the `health` package version used.
- **Progress photos** are AES-256-GCM encrypted (`cryptography`); the key lives in the OS keychain /
  keystore via `flutter_secure_storage`. On **macOS** the keychain needs a signed build: in Xcode set a
  *Team* for the Runner target (and add *Keychain Sharing* if prompted), otherwise the app shows
  "Secure storage isn't available" instead of saving photos. The macOS photo picker needs
  `com.apple.security.files.user-selected.read-only` (already added).
- Calorie and macro targets are calculated from your profile (Mifflin-St Jeor + goal).

## System integration (Phase 9)

| Feature | iOS | Android | macOS | Windows |
|---|---|---|---|---|
| Home screen widget (rings, steps, streak, next workout) | needs Xcode step below | ✓ | — | — |
| Live workout on lock screen | Live Activity + Dynamic Island (Xcode step below) | ongoing notification with timer | — | — |
| Quick actions (Start workout, Log water, Start walk) | ✓ long-press icon | ✓ long-press icon | — | — |
| Reminders (workout days, streak at 20:00, step goal, 3-day nudge) | ✓ | ✓ | ✓ | ✓ |
| Recovery score + coach tips (Home card) | ✓ | ✓ | from logged workouts only | same |
| Window size/position remembered | — | — | ✓ | ✓ |

Reminders are off by default. Turn them on in **Profile → Reminders**, which asks for notification permission, and pick the reminder time there. Workout reminders fire on the weekdays your active plan pins workouts to.

The recovery score combines sleep, HRV, resting heart rate (from Apple Health / Health Connect) and your recent training load. Without health data there is no score: the card asks you to connect health, and training-load tips still show. The coach sits behind the `CoachService` interface (`lib/features/coach/domain/coach_service.dart`), so an AI coach can replace the rules later.

**Android** is fully configured: the widget receiver, layout and metadata, notification receivers and `RECEIVE_BOOT_COMPLETED`. Add the widget from the launcher's widget picker ("PULSE").

**iOS widget and Live Activity: already set up.** `ruby tool/add_ios_widget_target.rb` added the `PulseWidgets` extension target to `ios/Runner.xcodeproj`, with the App Group entitlement on both targets, and embedded it in the app. The script is safe to re-run. When you sign for a real device, open *Signing & Capabilities* once so Xcode registers the App Group with your team. It's been checked on the iPhone 17 Pro Max simulator: the widget extension is registered, widget data reaches the App Group, and `integration_test/device_checks_test.dart` starts and ends a Live Activity.

<details><summary>The equivalent manual Xcode steps, for reference</summary>


1. `open ios/Runner.xcworkspace`
2. **File → New → Target… → Widget Extension**. Product name `PulseWidgets`. Untick *Include Configuration App Intent*, tick *Include Live Activity*, then click **Finish**. If asked to activate the scheme, choose **Cancel**.
3. Delete every Swift file Xcode generated in the new `PulseWidgets` group, then drag in `ios/PulseWidgets/PulseWidgets.swift` (target membership: **PulseWidgets** only).
4. Set the extension's **Minimum Deployments** to iOS 17.0.
5. Select the **Runner** target → *Signing & Capabilities* → **+ Capability → App Groups** → add `group.com.example.gymApp.pulse`. Do the same for the **PulseWidgets** target, using the same group. If you change your bundle id, change the group in `lib/core/platform/platform_capabilities.dart` (`pulseAppGroup`) and in `PulseWidgets.swift` too.
6. In the **PulseWidgets** target's *Info* tab, add `NSSupportsLiveActivities` = `YES`. The Runner already has it.
7. In the **Runner** target → *Build Phases*, make sure **Embed Foundation Extensions** (or *Embed App Extensions*) appears **above** *Run Script / Thin Binary*. If it's below, drag it up, or the build fails with a cycle error.
8. Run on a device or simulator, then long-press the home screen → **+** → PULSE. Start a workout and lock the phone to see the Live Activity.

Until you do this, the app still runs. Widget and Live Activity calls just do nothing.

</details>

**macOS / Windows**: the window frame is saved to `window_state.json` in app support and restored on launch. If its monitor is gone, the window opens centered instead.

## Polish, icons & store assets (Phase 10)

**Accessibility.** `test/app/accessibility_test.dart` opens every tab with Reduce Motion on, in dark and light mode and at 200 % text size. It checks Android and iOS tap-target sizes, labels on everything tappable, and WCAG text contrast. It also checks that every screen settles, so no animation keeps running with Reduce Motion on. Light mode uses the `accentText` colour token (a deeper green) for accent-coloured text, because lime on white fails contrast.

**Performance.** Run in profile mode, ideally on a real phone:

```bash
flutter drive --profile --driver=test_driver/perf_driver.dart --target=integration_test/perf_test.dart -d <device>
```

The frame-timing summaries are written to `build/{home,exercise_library,analytics}.timeline_summary.json`. On an M-series Mac, the 99th-percentile frame build time is under 2.3 ms everywhere. Raster (GPU) time averages 6.3 ms on Home and 2.4 ms in the exercise library. Glass cards share one backdrop blur through `BackdropGroup`, which cut Home's raster time by about 40 %.

**App icons and native splash.** The artwork comes from `tool/make_icon.swift`, which draws the heartbeat mark into `assets/icon/`. To regenerate everything:

```bash
swift tool/make_icon.swift
dart run flutter_launcher_icons        # Android (adaptive), iOS, macOS, Windows
dart run flutter_native_splash:create  # iOS + Android launch screen (dark, centered mark)
```

macOS and Windows have no native splash screen; the window opens straight onto the dark background. The app shows as **PULSE** on every platform.

**Store screenshots.** These use demo data from `integration_test/demo_data.dart`, which writes to an in-memory database and never touches your real data.

```bash
xcrun simctl boot "iPhone 17 Pro Max"
xcrun simctl status_bar "iPhone 17 Pro Max" override --time 9:41 --batteryState charged --batteryLevel 100
flutter drive --driver=test_driver/screenshot_driver.dart --target=integration_test/screenshots_test.dart -d "iPhone 17 Pro Max"
```

Seven screens are saved to `screenshots/<width>x<height>/`. Already captured: iPhone 17 Pro Max (1320×2868, the App Store's 6.9" size), iPad Pro 13" (2064×2752) and Pixel 8 Pro (1344×2992, for Google Play; set the Android demo status bar first with `adb shell am broadcast -a com.android.systemui.demo -e command clock -e hhmm 0941`).

On-device checks: `flutter test integration_test/device_checks_test.dart -d <device>` runs the accessibility audit on the five weeks of demo data, with real fonts, plus the Live Activity check on iOS.

## Maps before release

Route maps use OpenStreetMap's public tile server by default. That's fine for development, but [its policy](https://operations.osmfoundation.org/policies/tiles/) doesn't allow it for a published app. Sign up with a tile provider (for example Stadia Maps, MapTiler or Thunderforest; most have a free tier, and a dark style suits PULSE), then build with:

```bash
flutter build ipa \
  --dart-define=MAP_TILE_URL="https://tiles.stadiamaps.com/tiles/alidade_smooth_dark/{z}/{x}/{y}@2x.png?api_key=YOUR_KEY" \
  --dart-define=MAP_TILE_ATTRIBUTION="© Stadia Maps © OpenMapTiles © OpenStreetMap contributors"
```

Use the attribution text your provider requires; the map shows it in its corner.

## Your data

PULSE keeps everything in a local SQLite database (drift) on each device. It has no accounts and no server, and nothing leaves the device apart from what you choose to share to Apple Health / Health Connect. Uninstalling the app deletes the data.

## Adding a language

Copy `lib/l10n/app_en.arb` to `app_<locale>.arb` (e.g. `app_bn.arb` for Bangla), translate the values and
run `flutter pub get`. The locale is picked up automatically via `AppLocalizations.supportedLocales`.
