/// @description 
if (imm_frames > 0) {
	if (imm_frames % 2 == 1) {
		shader_set(shd_make_white);
	
	} else {
			shader_reset();
	}
	imm_frames--;
} 
if (shader != 0) shader_set(shader);
draw_self();
shader_reset();