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

kBut1		 = keyboard_check(ord("F")) or gamepad_button_check(0,gp_shoulderrb);
kBut2		 = keyboard_check_pressed(ord("1")) or gamepad_button_check_pressed(0, gp_face2);
kBut3		 = keyboard_check_pressed(ord("3")) or gamepad_button_check_pressed(0, gp_face3);
kBut4		 = keyboard_check_pressed(ord("2")) or gamepad_button_check_pressed(0, gp_face4);

if (kLeft) image_xscale = -1;
if (kRight) image_xscale = 1;
if (!obj_gameController.paused) { // if game isnt paused
	
	
	#region // take damage

	// temporary hp code
	if (hp <= 0) instance_destroy();
	
	
	
	
	
	#endregion
	
	#region // stats
	// regen mana
	if (!state = playerStates.casting) {
		if (mana < manaFull) {
			if (combatTimer <= 0) {
					mana = Approach(mana, manaFull, manaRegen);
			} else {
					mana = Approach(mana, manaFull, manaRegenCombat);
			}
		
		}
	}
	if (combatTimer > 0) combatTimer--;
	show_debug_message("mana: " + string(mana));
	//show_debug_message("hp: " + string(hp));
	show_debug_message("combat timer : " + string(combatTimer));
	
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
			canJump = true;
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
		if (kJump && cLeft && !onGround & canJump) {
			canJump = false;
		    if (kLeft) {
		        vy = -jumpHeight * 1.1;
		        vx =  jumpHeight * .35;
		    } else {
		        vy = -jumpHeight * 1.1;
		        vx =  vxMax * 0.75;
		    }  
		}

		if (kJump && cRight && !onGround & canJump) {
			canJump = false;
		    if (kRight) {
		        vy = -jumpHeight * 1.1;
		        vx = -jumpHeight * .35;
		    } else {
		        vy = -jumpHeight * 1.1;
		        vx = -vxMax * 0.75;
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
	if (canCast and kBut1) {
		state = playerStates.casting;
		vx = 0;
		
	} else {
		state = playerStates.run;	
		spell = 0;
	}
	if (state = playerStates.casting) {
		
		if (!instance_exists(obj_aimer))instance_create_depth(x,y,depth,obj_aimer);
		
		if (spell < 5) {
			if (kBut2) { // B
				if (spell = 0) { //if no inputs so far
					spell += 1;	//add to the first column
				} else {
					spell += 8; // else add to the 4th
				}	
			}
			if (kBut4) { // Y
				if (spell = 0) {
					spell += 2;
				} else {
					spell += 16;
				}	
			}
			if (kBut3) { // X
				if (spell = 0) {
					spell += 4;
				} else {
					spell += 32;
				}	
			}
		} else {
			
			switch (spell) {
				case 9: // fireball
					combatTimer = combatTimerMax
					
					mana -= spells.fireball;
					combatTimer = combatTimerMax
					var fb = instance_create_layer(x,y,layer,obj_fireball);
					var _dir = point_direction(x,y,obj_aimer.x,obj_aimer.y)
					fb.dir = _dir;
					var _base_damage = 2;
					fb.damage = damage * _base_damage;
					canCast = false;
					
					break;
				case 17: //lighting
					//will need to arc damage at the aimer
					combatTimer = combatTimerMax
					obj_aimer.alpha = Approach(obj_aimer.alpha, 0.1, 0.1);
					if (mana >= spells.lightning) {
						
						if (instance_number(obj_lightning)< 6) {
							mana-= spells.lightning;
							var light = instance_create_layer(obj_aimer.x ,obj_aimer.y ,layer,obj_lightning);
							light.targetX = x;
							light.targetY = y + irandom(5);
						
						}
					}
					if (keyboard_check_released(ord("F")) || gamepad_button_check_released(0,gp_shoulderrb)) {
						for (var i = 0; i < 6; i++)
						instance_destroy(obj_lightning);
						
					}
					break;
				case 33:// ice
					//much the same as fireball, the difference will be in the ice object itself
					if (keyboard_check_released(ord("F")) || gamepad_button_check_released(0,gp_shoulderrb)) {
							//var ice = instance_create(x,y,layer,obj_fireball);
							//ice.dir = point_direction(x,y,obj_aimer.x,obj_aimer.y);
							//var _base_damage = 1;
							//ice.damage = damage * _base_damage;
						}
					break;
				case 10:// push spirit
				
					break;
				case 18: // vines
				
					break;
				case 34: // rat swarm
					//can probably code this similiar to lightning
					break;
				case 12: // bend space
				
					break;
				case 20: // necromancy
				
					break;
				case 40: // remove space
				
					break;
					
			
			}
			
		}
		if (keyboard_check_released(ord("F")) || gamepad_button_check_released(0,gp_shoulderrb)) {
			spell = 0;
			state = playerStates.run;
			canCast = false;
		}
	}
	
	#endregion
}