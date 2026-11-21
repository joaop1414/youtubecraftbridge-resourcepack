#version 150

uniform sampler2D In;
uniform vec2 ScreenSize;
uniform float GameTime;

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

void main() {
    vec2 uv = texCoord;
    vec2 centered = uv - vec2(0.5);
    float time = GameTime * 1200.0;

    float wave = sin(centered.y * 24.0 + time) * 0.006;
    float ripple = sin(length(centered) * 34.0 - time * 1.4) * 0.004;
    uv.x += wave + ripple;
    uv.y += sin(centered.x * 18.0 + time * 0.8) * 0.003;

    vec4 color = texture(In, clamp(uv, vec2(0.001), vec2(0.999)));
    float aberration = 0.003 + abs(sin(time * 0.4)) * 0.002;
    float red = texture(In, clamp(uv + vec2(aberration, 0.0), vec2(0.001), vec2(0.999))).r;
    float blue = texture(In, clamp(uv - vec2(aberration, 0.0), vec2(0.001), vec2(0.999))).b;

    fragColor = vec4(red, color.g, blue, color.a);
}
