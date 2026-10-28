// Animated mesh gradient: three soft color blobs drifting over a base color.
// Used as the Home screen background.
#version 460 core
#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;
uniform float uTime;
uniform vec4 uColorA;
uniform vec4 uColorB;
uniform vec4 uColorC;
uniform vec4 uBase;

out vec4 fragColor;

float blob(vec2 p, vec2 center, float radius) {
  vec2 d = p - center;
  return exp(-dot(d, d) / (radius * radius));
}

void main() {
  vec2 uv = FlutterFragCoord().xy / uSize;
  float aspect = uSize.x / uSize.y;
  vec2 p = vec2(uv.x * aspect, uv.y);
  float t = uTime * 0.18;

  vec2 c1 = vec2((0.20 + 0.12 * sin(t * 1.3)) * aspect, 0.15 + 0.10 * cos(t * 1.7));
  vec2 c2 = vec2((0.85 + 0.10 * cos(t * 1.1)) * aspect, 0.30 + 0.14 * sin(t * 0.9));
  vec2 c3 = vec2((0.50 + 0.18 * sin(t * 0.7 + 1.0)) * aspect, 0.75 + 0.10 * cos(t * 1.3));

  float w1 = blob(p, c1, 0.45) * uColorA.a;
  float w2 = blob(p, c2, 0.40) * uColorB.a;
  float w3 = blob(p, c3, 0.50) * uColorC.a;

  vec3 color = uBase.rgb;
  color = mix(color, uColorA.rgb, w1);
  color = mix(color, uColorB.rgb, w2);
  color = mix(color, uColorC.rgb, w3);

  // Light dithering hides banding on dark gradients.
  float noise = fract(sin(dot(FlutterFragCoord().xy, vec2(12.9898, 78.233))) * 43758.5453);
  color += (noise - 0.5) / 255.0;

  fragColor = vec4(color, 1.0);
}
