// Diagonal light sweep for "new PR" badges. Drawn through a ShaderMask with
// BlendMode.srcATop, so it only lights up pixels the badge already covers.
#version 460 core
#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform float uProgress; // 0..1, one sweep across the badge
uniform vec4 uHighlight;

out vec4 fragColor;

void main() {
  vec2 uv = FlutterFragCoord().xy / uSize;
  // Position along a 30° diagonal, sweeping from -0.5 to 1.5.
  float axis = uv.x + uv.y * 0.55;
  float center = mix(-0.5, 2.0, uProgress);
  float band = smoothstep(0.22, 0.0, abs(axis - center));
  float a = band * uHighlight.a;
  fragColor = vec4(uHighlight.rgb * a, a);
}
