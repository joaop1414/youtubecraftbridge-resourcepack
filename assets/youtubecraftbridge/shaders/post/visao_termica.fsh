#version 330
#extension GL_ARB_separate_shader_objects : require

uniform sampler2D InSampler;

layout(location = 0) in vec2 texCoord;
layout(location = 0) out vec4 fragColor;

void main() {
    vec4 source = texture(InSampler, texCoord);
    float luminance = dot(source.rgb, vec3(0.2126, 0.7152, 0.0722));
    vec3 cold = vec3(0.02, 0.04, 0.42);
    vec3 blue = vec3(0.0, 0.72, 1.0);
    vec3 yellow = vec3(1.0, 0.88, 0.05);
    vec3 red = vec3(1.0, 0.08, 0.015);
    vec3 heat = mix(cold, blue, smoothstep(0.0, 0.38, luminance));
    heat = mix(heat, yellow, smoothstep(0.35, 0.68, luminance));
    heat = mix(heat, red, smoothstep(0.65, 0.95, luminance));
    fragColor = vec4(heat, source.a);
}
