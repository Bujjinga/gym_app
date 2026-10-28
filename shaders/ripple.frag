// Ripple distortion used as an ImageFilter (Impeller only). The engine sets
// uSize to the input texture size and binds the content to uTexture.
#version 460 core
#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform vec2 uCenter;   // ripple origin in logical pixels
uniform float uProgress; // 0..1
uniform float uScale;   // device pixel ratio
uniform sampler2D uTexture;

out vec4 fragColor;

void main() {
  vec2 frag = FlutterFragCoord().xy;
  vec2 center = uCenter * uScale;
  vec2 d = frag - center;
  float dist = length(d);

  float radius = uProgress * max(uSize.x, uSize.y) * 1.1;
  float width = 48.0 * uScale;
  float x = (dist - radius) / width;
  float strength = (1.0 - uProgress) * 14.0 * uScale;
  float wave = exp(-x * x) * sin(x * 6.2831) * strength;

  vec2 offset = dist > 0.0 ? (d / dist) * wave : vec2(0.0);
  vec2 uv = (frag - offset) / uSize;
#ifdef IMPELLER_TARGET_OPENGLES
  uv.y = 1.0 - uv.y;
#endif
  fragColor = texture(uTexture, uv);
}
