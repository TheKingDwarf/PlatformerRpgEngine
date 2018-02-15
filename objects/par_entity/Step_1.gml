/// @description 
onGround = OnGround();

var _damage_object = instance_place(x,y,par_damage);
	if (_damage_object and imm_frames <= 0) {
		
		var _damage = _damage_object.damage;
		imm_frames = 5;
		_damage = (_damage/armor)
		hp -= _damage;
		instance_destroy(_damage_object);
		
		combatTimer = combatTimerMax;
		
}




