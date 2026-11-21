#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:globals.glsl>

uniform sampler2D InSampler;

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

void main() {
    float t = GameTime * 1200.0;
    vec2 uv = texCoord;
    float band = floor(texCoord.y * 24.0);
    float shift = sin(band * 13.7 + t) * 0.006;
    shift += step(0.985, fract(sin(band * 91.7 + t * 0.17) * 43758.5)) * 0.025;
    uv.x += shift;

    vec2 safeUV = clamp(uv, vec2(0.002), vec2(0.998));
    vec2 redUV = clamp(safeUV + vec2(0.004, 0.0), vec2(0.002), vec2(0.998));
    vec2 blueUV = clamp(safeUV - vec2(0.004, 0.0), vec2(0.002), vec2(0.998));
    vec4 base = texture(InSampler, safeUV);
    float scanline = 0.96 + 0.04 * sin(texCoord.y * 900.0);
    fragColor = vec4(texture(InSampler, redUV).r, base.g, texture(InSampler, blueUV).b, base.a) * vec4(scanline, scanline, scanline, 1.0);
}
