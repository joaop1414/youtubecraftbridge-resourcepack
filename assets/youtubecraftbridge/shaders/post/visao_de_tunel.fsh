#version 330
#extension GL_ARB_separate_shader_objects : require

uniform sampler2D InSampler;

layout(location = 0) in vec2 texCoord;
layout(std140) uniform SamplerInfo {
    vec2 OutSize;
    vec2 InSize;
};
layout(location = 0) out vec4 fragColor;

void main() {
    vec4 color = texture(InSampler, texCoord);
    vec2 p = (texCoord - vec2(0.5)) * vec2(1.0, InSize.y / max(InSize.x, 1.0));
    float radius = length(p);
    float vignette = 1.0 - smoothstep(0.22, 0.72, radius);
    vignette = mix(0.08, 1.0, vignette);
    fragColor = vec4(color.rgb * vignette, color.a);
}
