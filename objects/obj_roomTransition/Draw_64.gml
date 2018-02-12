/// @description 
if (instance_place(x,y,obj_player)) {
	
	triggered = true;
	with (obj_player) state = playerStates.frozen;
}
if (triggered and !surf1made) {
	surf1 = surface_create(640,360);
	surface_copy(surf1,0,0,application_surface)
	room_goto(room_to);	
	surf1made = true;
}

if (triggered and !surf2made) {
	surf2 = surface_create(640,360)	
	surface_copy(surf2,0,0,application_surface)
	surf2made = true;
}

if(triggered) {
	frame++;
	if (frame = 1) {
		if (surface_exists(surf1))
		draw_surface_ext(surf1,0,0,global.scale_factor,global.scale_factor,0,c_white,1);		
	}
	
	if (frame > 1) {
		var xxxx = (frame/maxframes)*640;
		show_debug_message(string(xxxx));
		if (surface_exists(surf1))
		draw_surface_ext(surf1,-xxxx,0,global.scale_factor,global.scale_factor,0,c_white,1);	
		
		if (surface_exists(surf2))
		draw_surface_ext(surf2,640-xxxx,0,global.scale_factor,global.scale_factor,0,c_white,1);
		obj_player.x = new_x;
		obj_player.y = new_y;
		
	}
	if (frame >= maxframes) {
		with (obj_player) state = playerStates.run;
		instance_destroy();
		
	}
}