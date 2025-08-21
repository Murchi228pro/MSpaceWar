shader_type canvas_item;

uniform float whiteness: hint_range(0.0, 1.0) = 0.0;
uniform float rstep = 0.5;

float round_step(float value){
	return round(value / rstep) * rstep;
}

void fragment(){
	vec4 orig = texture(TEXTURE, UV);
	vec3 white = vec3(1.0, 1.0, 1.0);
	float whiter = round_step(whiteness);
	vec3 final_color = mix(orig.rgb, white, whiter);
	COLOR = vec4(final_color, COLOR.a);
	
}

void vertex(){
	
}
//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
