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
    vec2 resolution = max(InSize, vec2(1.0));
    float blockSize = 7.0;
    vec2 pixel = (floor(texCoord * resolution / blockSize) * blockSize + blockSize * 0.5) / resolution;
    fragColor = texture(InSampler, clamp(pixel, vec2(0.001), vec2(0.999)));
}
