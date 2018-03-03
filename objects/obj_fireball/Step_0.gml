/// @description 
//move 
x += lengthdir_x(spd,dir);
y += lengthdir_y(spd,dir);


//particles
var part_x = x +4 +  irandom_range(-4,4); // makes the particles tend towards the middle, but still be random
var part_y = y +4 +  irandom_range(-4,4); // makes the particles tend towards the middle, but still be random
part_particles_create(part,part_x,part_y,fire_p,irandom_range(1,2))

//collision with entity
var coll = PlaceMeetingException(x,y,par_entity,obj_player.id)
if (coll) {
	obj_camera.screenshake+=4;
	coll.vx += lengthdir_x(spd/2,dir);
	coll.vy += lengthdir_y(spd/2,dir);
	var dam = instance_create_layer(x,y,dam_layer,par_damage);
	dam.damage = damage;
	dam.parent = parent;
	instance_destroy()
}

//collision with movey block
var coll = instance_place(x,y,par_pushable);
if (coll) {
	obj_camera.screenshake+=2;
	coll.vx += lengthdir_x(spd/2,dir);
	coll.vy += lengthdir_y(spd/2,dir);
	instance_destroy();
}


//collision with anything else
var coll = instance_place(x,y,obj_solid);
if (coll) {
	instance_destroy();
	obj_camera.screenshake++;
}
