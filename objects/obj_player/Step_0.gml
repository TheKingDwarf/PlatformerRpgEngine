//check for paused
		
	// Input //////////////////////////////////////////////////////////////////////
		var kLeft, kRight, kUp, kDown, kJump, kJumpRelease, tempAccel, tempFric, kBut1, kBut2, kBut3, kBut4;
var gamepadThreshold = .3;
kLeft        = keyboard_check(ord("A")) or (gamepad_axis_value(0,gp_axislh)<-gamepadThreshold);
kRight       = keyboard_check(ord("D")) or (gamepad_axis_value(0,gp_axislh)> gamepadThreshold);
kUp          = keyboard_check(ord("W")) or (gamepad_axis_value(0,gp_axislv)<-gamepadThreshold);
kDown        = keyboard_check(ord("S")) or (gamepad_axis_value(0,gp_axislv)> gamepadThreshold);

kJump        =  keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0,gp_face1);
kJumpRelease = keyboard_check_released(vk_space)or gamepad_button_check_released(0,gp_face1);

kBut1		 = mouse_check_button(mb_left) or gamepad_button_check(0,gp_shoulderrb);
kBut2		 = keyboard_check(ord("1")) or gamepad_button_check(0, gp_face2);
kBut3		 = keyboard_check(ord("2")) or gamepad_button_check(0, gp_face3);
kBut4		 = keyboard_check(ord("3")) or gamepad_button_check(0, gp_face4);
if (!obj_gameController.paused) { // if game isnt paused
	
	
	#region // take damage
	var _damage_object = instance_place(x,y,par_damage);
	if (_damage_object) {
		var _damage = _damage_object.damage;
		_damage = (_damage/armor)
		hp -= _damage;
		instance_destroy(_damage_object);
		
		combatTimer = combatTimerMax;
		
	}
	
	
	
	
	
	#endregion
	
	#region // regenerate mana
	if (mana < manaFull) {
		if (combatTimer <= 0) {
				mana += manaRegen;
		} else {
				mana += manaRegenCombat;
		}
		
	}
	
	
	#endregion
	
	
	
	#region state = run
	if (state = playerStates.run) {

// Movement ///////////////////////////////////////////////////////////////////
//update
		cLeft  = place_meeting(x - 1, y, obj_solid);
		cRight = place_meeting(x + 1, y, obj_solid);
		// Apply the correct form of acceleration and friction
		if (onGround) {
		    tempAccel = groundAccel;
		    tempFric  = groundFric;
			canCast = true;
		} else {
			canCast = false;
		    tempAccel = airAccel;
		    tempFric  = airFric;
		}

		// Reset wall cling
		if ((!cRight && !cLeft) || onGround) {
		    canStick = true;
		    sticking = false;
		}   

		// Cling to wall
		if (((kRight && cLeft) || (kLeft && cRight)) && canStick && !onGround) {
		    alarm[0] = clingTime;
		    sticking = true; 
		    canStick = false;       
		}

		// Handle gravity
		if (!onGround) {
		    if ((cLeft || cRight) && vy >= 0) {
		        // Wall slide
		        vy = Approach(vy, vyMax, gravSlide);
		    } else {
		        // Fall normally
		        vy = Approach(vy, vyMax, gravNorm);
		    }
		}

		// Left 
		if (kLeft && !kRight && !sticking) {
		    // Apply acceleration left
		    if (vx > 0)
		        vx = Approach(vx, 0, tempFric);   
		    vx = Approach(vx, -vxMax, tempAccel);
		}

		// Right 
		if (kRight && !kLeft && !sticking) {
		    // Apply acceleration right
		    if (vx < 0)
		        vx = Approach(vx, 0, tempFric);   
		    vx = Approach(vx, vxMax, tempAccel);
		}

		// Friction
		if (!kRight && !kLeft)
		    vx = Approach(vx, 0, tempFric); 
        
		// Wall jump
		if (kJump && cLeft && !onGround) {
		    if (kLeft) {
		        vy = -jumpHeight * 1.1;
		        vx =  jumpHeight * .75;
		    } else {
		        vy = -jumpHeight * 1.1;
		        vx =  vxMax;
		    }  
		}

		if (kJump && cRight && !onGround) {
		    if (kRight) {
		        vy = -jumpHeight * 1.1;
		        vx = -jumpHeight * .75;
		    } else {
		        vy = -jumpHeight * 1.1;
		        vx = -vxMax;
		    }  
		}
 
		// Jump 
		if (kJump) { 
		    if (onGround)
		        vy = -jumpHeight;
		    // Variable jumping
		} else if (kJumpRelease) { 
		    if (vy < 0)
		        vy *= 0.25;
		}	
	
	
	
	}
	#endregion
	
	#region state = casting
	if (canCast and kBut1) state = playerStates.casting;
	
	if (state = playerStates.casting) {
		
		
	}
	
	#endregion
}