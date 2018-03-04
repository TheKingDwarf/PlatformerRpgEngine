/// @description 
var coll = instance_place(x,y,par_enemy_debug)
if (coll) {
	with (coll) {
		frame = 10;
		instance_create_layer(x,y,global.FXlayer,obj_coin);
	}
	instance_destroy();
}