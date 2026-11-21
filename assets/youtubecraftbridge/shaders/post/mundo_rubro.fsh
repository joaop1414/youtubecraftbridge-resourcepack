#version 330
#extension GL_ARB_separate_shader_objects : require

uniform sampler2D InSampler;

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

void main() {
    vec4 color = texture(InSampler, texCoord);
    float luminance = dot(color.rgb, vec3(0.2126, 0.7152, 0.0722));
    vec3 redWorld = vec3(
        min(1.0, luminance * 1.15 + color.r * 0.18),
        luminance * 0.13,
        luminance * 0.17
    );
    fragColor = vec4(mix(color.rgb, redWorld, 0.82), color.a);
}
