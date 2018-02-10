/// @description 
// Example

#region vertical movemetn
repeat (abs(vy)) { // repeat vy times
	if (!place_meeting(x,y +sign(vy),par_bumper)) { // did we hit a bumper
		with (par_entity) { // go into the entity that is riding the moving platform
			if (place_meeting(x,y+1,other.id)) { // if above the platform, while it goes up
				if (!PlaceMeetingException(x, y + sign(other.vy), obj_solid, other.id)) {//make sure we arent pushed into a wall
					y += sign(other.vy);//if we arent either of those things, add the speed of the platform to our speed	
				
				} else { // if we do collide with a wall
					hp--;	//deal damage. since this should in theory run 60 times a second it should be instadeath.
				}
				
			}
			if (place_meeting(x, y - 1, other.id))//if we are going down
                y += sign(vy);// addd the speed of the platform
			
		}
		y += sign(vy);//add our speed to vy
		
	} else {
		vy = -vy;//switch direction if we hit a bumper	
		if (abs(vx) > 0) vx = -vx;
	
	}	
}
#endregion

#region horizontal
repeat (abs(vx)) { // repeat vx times
	if (!instance_place(x + sign(vx),y,par_bumper)) {
		with (par_entity) {
			if (instance_place(x, y + 1, other.id)) { // if we are on the platform
				if (!PlaceMeetingException(x + sign(other.vx), y, obj_solid, other.id)) { // if we dont collide with other walls
					x += sign(other.vx);// move with the platform
				}	
			} else { // if we are not on the platform, check for being crushed
				if (instance_place(x+1,y,other.id)and instance_place(x-1,y,obj_solid)) {
					hp--;	
				}
				if (instance_place(x-1,y,other.id)and instance_place(x+1,y,obj_solid)) {
					hp--;	
				}
				
			}
			
		}
		
		
		
		x += sign(vx);
		
	} else {
		vx = -vx;
		if (abs(vy) > 0) vy = -vy;
	}

}
#endregion