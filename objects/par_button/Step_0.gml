/// @description 
if (instance_place(x,y,par_entity) or instance_place(x,y,par_pushable)) {
	image_index = 1;
	triggered = true;
	control.locked = false;
} else {
	image_index = 0;
	triggered = false;
	control.locked = true;
}