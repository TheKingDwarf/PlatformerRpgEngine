/// @description 
entityCollision = instance_place(x,y,par_entity);

if (obj_gameController.wind != 0) {
	_sin+=4;
	
	_sin = Wrap(_sin, 0, 359);
	wind += dsin(_sin)/3;
	//wind = obj_gameController.wind * (dsin(_sin)+(dcos(_sin)*dcos(_sin)));
}

if (entityCollision) {
	with (entityCollision) { // with colliding entity
		if (abs(vx+abs(knockback))> 0) {
			other.shift += 2 * (max(1 * sign(vx),vx/3));	//add a bit to shift if moving	
		} else {
			other.shift = Approach(other.shift, other.wind, .1); // else approach wind
		}
	}
	if (abs(shift) > maxshift) shift = maxshift * sign(shift);//if over maxshift, = maxshift
} else {
	shift = Approach(shift, wind, .1); // else approach wind
	if (abs(shift) > maxshift) shift = maxshift * sign(shift);//if over maxshift, = maxshift
}

blockCollision = instance_place(x,y,par_pushable);

if (blockCollision) {
	with (blockCollision) { // with colliding entity
		if (abs(vx)> 0) {
			other.shift += 2 * (max(1 * sign(vx),vx/3));	//add a bit to shift if moving	
		} else {
			other.shift = Approach(other.shift, other.wind, .3); // else approach wind
		}
	}
	if (abs(shift) > maxshift) shift = maxshift * sign(shift);//if over maxshift, = maxshift
} else {
	shift = Approach(shift, wind, .1); // else approach wind
	if (abs(shift) > maxshift) shift = maxshift * sign(shift);//if over maxshift, = maxshift
}