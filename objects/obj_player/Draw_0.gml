/// @description draw character
event_inherited();
// hit flash
var _prevshader = shader_current();
if(hit_crit) {
	shader_set(shd_make_red);
	hit_crit = false;
}
else if(hit_flash) {
	shader_set(shd_make_white);
	hit_flash = false;
}
else if(iframes % 2 == 1) {
	shader_set(shd_make_white);
}
else if(dash % 2 == 1) {
	shader_set(shd_make_blue);
}

if(!attacking) {
	if(jumping) {
		sprite_state = ESpriteState.MOVE
		image_speed = 0;
		image_index = 0;
	}
	else {
		image_speed = 1;	
	}
}
if(visible) {
	if(sprite_array[sprite_state, ESpritePart.BODY] != noone) draw_sprite_ext(sprite_array[sprite_state, ESpritePart.BODY], image_index, x, y, draw_dir, 1.0, 0, c_white, 1.0)
	if(sprite_array[sprite_state, ESpritePart.WEAPON] != noone) draw_sprite_ext(sprite_array[sprite_state, ESpritePart.WEAPON], image_index, x, y, draw_dir, 1.0, 0, c_white, 1.0)
	if(sprite_array[sprite_state, ESpritePart.ARMS] != noone) draw_sprite_ext(sprite_array[sprite_state, ESpritePart.ARMS], image_index, x, y, draw_dir, 1.0, 0, c_white, 1.0)
}
shader_set(_prevshader);
