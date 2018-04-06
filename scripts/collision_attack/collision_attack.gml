if (instance_place(x,y,obj_player)) {
	var _dam = instance_create(obj_player.x,obj_player.y, par_damage)	
	_dam.parent = id;
	_dam.damage = damage;
	attack_timer = 5;
}