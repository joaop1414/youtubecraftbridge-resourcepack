#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:globals.glsl>

uniform sampler2D InSampler;

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

void main() {
    float t = GameTime * 180.0;
    vec2 centered = texCoord - vec2(0.5);
    vec2 uv = texCoord;
    uv += vec2(sin(texCoord.y * 13.0 + t), cos(texCoord.x * 11.0 - t)) * 0.0015;
    vec4 source = texture(InSampler, clamp(uv, vec2(0.002), vec2(0.998)));
    vec3 ice = source.rgb * vec3(0.58, 0.82, 1.18);
    ice = mix(ice, vec3(0.62, 0.86, 1.0), 0.24);
    float edge = smoothstep(0.42, 0.72, length(centered));
    ice = mix(ice, ice * vec3(0.72, 0.88, 1.15), edge * 0.55);
    fragColor = vec4(ice, source.a);
}
