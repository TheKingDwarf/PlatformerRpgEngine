/// @description 
x += lengthdir_x(spd,dir);
y += lengthdir_y(spd,dir);

var coll = PlaceMeetingException(x,y,par_entity,obj_player.id)
if (coll) {
	var dam = instance_create_layer(x,y,dam_layer,par_damage);
	dam.damage = damage;
	dam.parent = parent;
	instance_destroy()
}
