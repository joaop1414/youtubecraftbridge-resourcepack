#version 150

uniform sampler2D In;

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

void main() {
    vec4 color = texture(In, texCoord);
    float luminance = dot(color.rgb, vec3(0.2126, 0.7152, 0.0722));
    vec3 crimson = vec3(
        min(1.0, luminance * 1.18 + color.r * 0.18),
        luminance * 0.16,
        luminance * 0.20
    );
    fragColor = vec4(mix(color.rgb, crimson, 0.78), color.a);
}
