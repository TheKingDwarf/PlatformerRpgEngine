/// @description 
var onGround = OnGround();
// check for grav
if (!onGround) {
	vy = Approach(vy,vyMax,gravNorm);
	var collision = collision_line(x,y+1,x+sprite_width-1,y+1,par_entity,false,true)//check for collision
	if (collision != noone){
		collision.hp = 0;	
	}
	vx = 0;
}

// collision
//left
var coll = instance_place(x-1,y,par_entity);
if (coll) {//if pushing from left, move right
	vx = Approach(vy,vyMax,accel);		
} else {
	coll = instance_place(x+1,y,par_entity)
	if (coll) {//if pushing from right, move left
		vx = Approach(vy,-vyMax,accel);	
	} else {
		vx = 0;	//otherwise dont move
	}
}


	




