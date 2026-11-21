#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:globals.glsl>

uniform sampler2D InSampler;

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

void main() {
    float t = GameTime * 420.0;
    vec2 centered = texCoord - vec2(0.5);
    vec2 uv = texCoord;
    uv.x += sin(texCoord.y * 20.0 + t) * 0.003;
    uv.y += cos(texCoord.x * 17.0 - t) * 0.002;
    vec4 source = texture(InSampler, clamp(uv, vec2(0.002), vec2(0.998)));
    float luminance = dot(source.rgb, vec3(0.2126, 0.7152, 0.0722));
    vec3 toxic = vec3(luminance * 0.48, luminance * 1.12 + 0.08, luminance * 0.20);
    float vignette = smoothstep(0.82, 0.18, length(centered));
    toxic *= mix(0.68, 1.0, vignette);
    fragColor = vec4(toxic, source.a);
}
