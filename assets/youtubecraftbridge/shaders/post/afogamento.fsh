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
    float t = GameTime * 500.0;
    vec2 uv = texCoord;
    uv.x += sin(texCoord.y * 18.0 + t) * 0.003;
    uv.y += cos(texCoord.x * 15.0 + t * 0.7) * 0.002;
    vec4 color = texture(InSampler, clamp(uv, vec2(0.001), vec2(0.999)));
    vec3 blue = color.rgb * vec3(0.62, 0.84, 1.18);
    blue.b += 0.06;
    fragColor = vec4(mix(color.rgb, blue, 0.68), color.a);
}
