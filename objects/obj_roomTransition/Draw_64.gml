/// @description 
if (instance_place(x,y,obj_player)) {
	
	triggered = true;
	with (obj_player) state = playerStates.frozen;
	obj_audioController.next_track = music;
}

if (triggered) {
	if (phase_2 = false) {
		if (alpha < 1) {
			alpha += 1/(maxframes/2);	
		} else {
			room_goto(room_to);
	
		}
	} else {
		if (alpha > 0) {
			alpha -= 1/(maxframes/2);	
		}	
	}
	show_debug_message(string(alpha));
	draw_set_alpha(alpha);
	draw_set_color(c_black);
	draw_rectangle(0,0,640*global.scale_factor,360*global.scale_factor,false);
	draw_set_alpha(1)
	draw_set_color(c_white);
}