


if (attack_timer <= 0) {
if (distance_to_object(obj_player)<= range and onGround) {
	var dir = sign(obj_player.x-x);
	hspd = (maxHspd * 2 * dir);
	vspd = -(maxVspd)+irandom(maxVspd/2);
	attack_timer = 45;
}
}
if (instance_place(x,y,obj_player)) {
	var _dam = instance_create(obj_player.x,obj_player.y, par_damage)	
	_dam.parent = id;
	_dam.damage = damage;
	attack_timer = 5;
}
