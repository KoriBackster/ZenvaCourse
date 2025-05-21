shader_type canvas_item;

uniform sampler2D gradient;
uniform float mix_amount = 1.0;
void fragment() {
	vec4 input_color = texture(TEXTURE, UV);
	float grayscale_value = dot(input_color.rgb, vec3(0.299, 0.587, 0.114));
	vec3 sample_color = texture(gradient, vec2(grayscale_value, 0.0)).rgb;

	COLOR.rgb = mix(input_color.rgb, sample_color, mix_amount);
	COLOR.a = input_color.a;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
