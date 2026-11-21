#version 150

uniform sampler2D In;
uniform vec2 ScreenSize;

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

void main() {
    vec4 color = texture(In, texCoord);
    vec2 centered = (texCoord - vec2(0.5)) * vec2(1.0, ScreenSize.y / ScreenSize.x);
    float distanceFromCenter = length(centered);
    float vignette = 1.0 - smoothstep(0.28, 0.78, distanceFromCenter);
    vignette = mix(0.12, 1.0, vignette);
    fragColor = vec4(color.rgb * vignette, color.a);
}
