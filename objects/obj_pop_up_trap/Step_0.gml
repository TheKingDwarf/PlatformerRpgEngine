/// @description Insert description here
// You can write your code in this editor
if (state = 0) {
	if (instance_place(x,y-1,obj_player)) {
		state = 1;
		alarm[0] = recover_time;
		sprite_index = sprite2;
	}
}
if (state = 1){ 
	if (instance_place(x,y,obj_player)) {
		var _dam = instance_create(obj_player.x,obj_player.y,par_damage)
		_dam.damage = damage;	
	}
	
}