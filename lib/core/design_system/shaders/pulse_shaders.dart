import 'dart:ui' as ui;

/// Loads each fragment program once and shares it. Callers must handle a
/// failed load (e.g. unsupported backend) by falling back to plain painting.
abstract final class PulseShaders {
  static final Future<ui.FragmentProgram> meshGradient =
      ui.FragmentProgram.fromAsset('shaders/mesh_gradient.frag');
  static final Future<ui.FragmentProgram> shimmer =
      ui.FragmentProgram.fromAsset('shaders/shimmer.frag');
  static final Future<ui.FragmentProgram> ripple =
      ui.FragmentProgram.fromAsset('shaders/ripple.frag');
}
