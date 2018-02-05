/// @description motion

if(not global.pause) {
	// horizontal movement
	if(abs(ctrl_move) > 0) {
		hspd += ctrl_move * accel;
	}
	else {
		hspd -= hspd * decel;	
		if(abs(hspd) < 0.5) hspd = 0;
	}

	hspd = clamp(hspd, -max_hspd, max_hspd);
	hspd += hpush;
	if(abs(hpush) > 0.5) hpush *= 0.8;
	else hpush = 0;
	
	if(dash) hspd *= 2;


	if(place_meeting(x+hspd, y, obj_solid)) {
		while(!place_meeting(x+sign(hspd), y, obj_solid)) {
			x += sign(hspd);
		}
		hspd = 0;
	}
	x += hspd;

	// vertical movement + gravity
	vspd = clamp(vspd+grav, -max_vspd, max_vspd);
	vspd += vpush;
	vpush = 0;

	// when above a solid object
	if(place_meeting(x, y+grav, obj_solid)) {
		if(jumping) { // dust effect on landing
			particle_effect = 8;
			particle_y = y;
		}
	
		// jumping
		if(ctrl_jump) {
			vspd = ctrl_jump * -jumpspeed; // jump if ctrl_jump is non-zero
			particle_effect = 5; //  dust effect on jump
			particle_y = y;
			audio_sound_pitch(snd_jump, random_range(0.9, 1.1))
			audio_play_sound(snd_jump,3,false);
		}
	
		// face direction
		if(ctrl_move > 0) {
			draw_dir = 1;
			sprite_state = ESpriteState.MOVE;
		}
		else if(ctrl_move < 0) {
			draw_dir = -1;
			sprite_state = ESpriteState.MOVE;
		}
		else {
			sprite_state = ESpriteState.IDLE;
		}
	
		// dust effect on movement or deceleration
		if(abs(hspd) > 0) {
			if(abs(ctrl_move) == 0 and abs(hspd) > 0.5) {
				particle_effect = 1;
				particle_y = y;
			}
			else if(irandom(30) < 5) {
				particle_effect = 3;
				particle_y = y;
			}
		}
	
		// not jumping
		jumping = 0;
	}
	else {
		// jumping
		sprite_state = ESpriteState.MOVE;
		if(jumping == 0) {
			jumping = 1;
		}
	}

	if(place_meeting(x, y+vspd, obj_solid)) {
		while(!place_meeting(x, y+sign(vspd), obj_solid)) {
			y += sign(vspd);
		}
		vspd = 0;
	
		if(jumping) { // dust effect on landing
			particle_effect = 8;
			particle_y = y;
		}
		jumping = 0;
	}
	y += vspd;

	if(attacking) {
		sprite_state = ESpriteState.ATTACK;
	}
}

if(hit_damage and iframes == 0) {
	hp -= hit_damage;
	hit_damage = 0;
	iframes = max_iframes;
	hit_flash = true;
}
else {
	hit_damage = 0;
}

if(iframes) iframes --;

