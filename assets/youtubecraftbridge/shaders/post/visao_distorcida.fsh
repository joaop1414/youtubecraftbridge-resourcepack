#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:globals.glsl>

uniform sampler2D InSampler;

layout(location = 0) in vec2 texCoord;
layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 InSize;
};
layout(location = 0) out vec4 fragColor;

void main() {
    vec2 centered = texCoord - vec2(0.5);
    float t = GameTime * 900.0;
    vec2 uv = texCoord;
    uv.x += sin(centered.y * 28.0 + t) * 0.008;
    uv.y += sin(centered.x * 19.0 - t * 0.8) * 0.004;
    float split = 0.0025;
    vec2 redUV = clamp(uv + vec2(split, 0.0), vec2(0.001), vec2(0.999));
    vec2 blueUV = clamp(uv - vec2(split, 0.0), vec2(0.001), vec2(0.999));
    vec2 safeUV = clamp(uv, vec2(0.001), vec2(0.999));
    vec4 base = texture(InSampler, safeUV);
    fragColor = vec4(texture(InSampler, redUV).r, base.g, texture(InSampler, blueUV).b, base.a);
}
