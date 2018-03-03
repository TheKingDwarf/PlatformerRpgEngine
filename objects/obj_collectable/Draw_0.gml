/// @description 
if (alarm[1] <= 45 and alarm[1] mod 2 = 1) {
	draw_sprite_ext(sprite_index,0,0,0,1,1,0,c_white,1)	
} else {
	draw_self();	
}