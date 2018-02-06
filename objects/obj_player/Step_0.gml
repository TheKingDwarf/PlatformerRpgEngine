//check for paused
scr_input();
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
		if
		
	}
	
	#endregion
	
	#region falling
	if (state = playerStates.falling) {
	
	
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
	
	
	
	
}