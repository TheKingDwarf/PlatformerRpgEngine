/// @description 
if (imm_frames > 0) {
	if (imm_frames % 2 == 1) {
		shader_set(shd_make_white);
	
	} else {
			shader_reset();
	}
	imm_frames--;
} 
draw_sprite(sprite_index,image_index,draw_xscale*image_xscale,draw_yscale*image_yscale);
shader_reset();