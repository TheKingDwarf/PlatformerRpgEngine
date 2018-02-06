//check for paused

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
	// Input //////////////////////////////////////////////////////////////////////
		scr_input();
// Movement ///////////////////////////////////////////////////////////////////

		// Apply the correct form of acceleration and friction
		if (onGround) {
		    tempAccel = groundAccel;
		    tempFric  = groundFric;
		} else {
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
	
	
}