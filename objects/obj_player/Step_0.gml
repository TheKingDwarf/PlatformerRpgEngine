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
	
	
	
	#region idle
	if (state = playerStates.idle) {
			
		
		
	}
	#endregion
	
	#region run
	if (state = playerStates.run) {
		canCast = true;
		if (instance_place(x,y+1,obj_solid)) {
		
		
			if (global.inputRight) {
				if (hspd < maxHspd) hspd += accel;	
				image_xscale = 1;
			} else if (global.inputLeft) {
				if (hspd > -maxHspd) hspd -= accel;
				image_xscale = -1;	
			}
		
			if (instance_place(x,y+1,obj_one_way_platform) and global.inputDown) {
				vspd = -1;
				state = playerStates.falling;
			}
		
		}
		
		if (global.inputSpace) {
			jumping = true;	
		} else {
			jumping = false;
		}
		
		if (jumping && vspd < maxVspd) {
			vspd+= jumpAccel;
		} else {
			if (!place_meeting(x,y+1,obj_solid)) state = playerStates.falling;	
		}
		
		
		
	}
	
	#endregion
	
	#region falling
	if (state = playerStates.falling) {
		canCast = false;
		if (vspd > -maxHspd) vspd -= grav;
		
		if (global.inputRight) {
				if (hspd < maxHspd) hspd += accel;	
				image_xscale = 1;
			} else if (global.inputLeft) {
				if (hspd > -maxHspd) hspd -= accel;
				image_xscale = -1;	
		}
	
	}
	#endregion
	
	#region casting
	if (state = playerStates.casting) {
		
		
	}
	
	#endregion
	
	#region frozen
	if (state = playerStates.frozen) {
	
	}
	#endregion
	
	#region apply hspd vspd and knockback
		var _xx_move = floor(hspd+knockback);
		var _yy_move = floor(vspd+(knockback/4));
		var _xx_sign = sign(_xx_move);
		var _yy_sign = sign(_yy_move);
		
		var _xx_move =abs(_xx_move );
		var _yy_move =abs(_yy_move );
		
		
		for (var i = 0; i < _xx_move; i++) {
			if (!instance_place(x+_xx_sign,y,obj_solid)) x += _xx_sign;
		}
		
		for (var k = 0; k < _yy_move; k++) {
			if (!instance_place(x,y+_yy_sign,obj_solid))y += _yy_sign;	
		}
		knockback = 0;
	#endregion
	
	
}