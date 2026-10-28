import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:window_manager/window_manager.dart';

import '../design_system/tokens/pulse_colors.dart';
import 'platform_capabilities.dart';
import 'window_state.dart';

const _minSize = Size(900, 600);

/// Desktop window setup: restores the last size, position and maximized
/// state (default 1280×820 centered), 900×600 minimum, dark background so
/// there's no white flash on launch. No-op on mobile.
Future<void> configureDesktopWindow() async {
  if (!PlatformCapabilities.current().isDesktop) return;
  await windowManager.ensureInitialized();
  final file = File(p.join((await getApplicationSupportDirectory()).path, 'window_state.json'));
  final saved = await _read(file);
  final screens = [
    for (final d in await screenRetriever.getAllDisplays())
      (d.visiblePosition ?? Offset.zero) & (d.visibleSize ?? d.size),
  ];
  final frame = saved?.fit(screens, _minSize);
  final options = WindowOptions(
    title: 'PULSE',
    size: frame?.size ?? const Size(1280, 820),
    minimumSize: _minSize,
    center: frame == null,
    backgroundColor: PulseColors.dark.background,
  );
  await windowManager.waitUntilReadyToShow(options, () async {
    if (frame != null) await windowManager.setBounds(frame);
    if (saved?.maximized ?? false) await windowManager.maximize();
    await windowManager.show();
    await windowManager.focus();
  });
  windowManager.addListener(_WindowStateSaver(file));
}

Future<WindowState?> _read(File file) async {
  try {
    return WindowState.fromJson(jsonDecode(await file.readAsString()) as Map<String, dynamic>);
  } catch (_) {
    return null; // first launch or unreadable file: use defaults
  }
}

/// Writes the window frame shortly after it stops changing.
class _WindowStateSaver with WindowListener {
  _WindowStateSaver(this._file);

  final File _file;
  Timer? _debounce;

  void _schedule() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), _save);
  }

  Future<void> _save() async {
    final maximized = await windowManager.isMaximized();
    // Keep the restored (un-maximized) frame so un-maximizing next launch works.
    final previous = maximized ? await _read(_file) : null;
    final bounds = previous?.bounds ?? await windowManager.getBounds();
    await _file.writeAsString(jsonEncode(WindowState(bounds, maximized: maximized).toJson()));
  }

  @override
  void onWindowResized() => _schedule();

  @override
  void onWindowMoved() => _schedule();

  @override
  void onWindowMaximize() => _schedule();

  @override
  void onWindowUnmaximize() => _schedule();
}
