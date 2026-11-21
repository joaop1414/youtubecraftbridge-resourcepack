#version 150

uniform sampler2D In;
uniform vec2 ScreenSize;
uniform float GameTime;

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

void main() {
    float time = GameTime * 900.0;
    vec2 uv = texCoord;
    uv.x += sin(uv.y * 22.0 + time) * 0.004;
    uv.y += cos(uv.x * 17.0 + time * 0.7) * 0.003;

    vec4 color = texture(In, clamp(uv, vec2(0.001), vec2(0.999)));
    vec3 blueTint = color.rgb * vec3(0.58, 0.82, 1.18);
    blueTint.b += 0.08;
    fragColor = vec4(mix(color.rgb, blueTint, 0.58), color.a);
}
