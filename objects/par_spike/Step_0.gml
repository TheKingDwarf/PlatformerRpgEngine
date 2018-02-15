/// @description 
var coll = instance_place(x+1*image_xscale,y,par_entity);
if (coll) {
	var dam = instance_create_layer(coll.x,coll.y,layer,par_damage);
	coll.knockback += 3*image_xscale;		
}