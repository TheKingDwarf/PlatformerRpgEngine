/// @description ai code for a Melee type enemy
if (state = EnemyStates.frozen) {
	vx = 0;
	shader = shd_make_blue;
}
// do stuff based off inputs
if (state = EnemyStates.normal) {
	#region check if player is near
	var modif = 0; //is image_xscale negative
	var inCone = false;
	if (image_xscale = -1) modif = 180-visionCone;
	//calculate whetehr or not player is in view cone
	var point1X = lengthdir_x(agroRange,modif)+x
				
	var point2X = lengthdir_x(agroRange,modif+visionCone)+x
	var point1Y = lengthdir_y(agroRange,modif)+y
				
	var point2Y = lengthdir_y(agroRange,modif+visionCone)+y
	if (point_in_triangle(obj_player.x,obj_player.y,x,y,point1X,point1Y,point2X,point2Y))inCone = true;
	if (needsSight)
	if (collision_line(x,y,obj_player.x,obj_player.y,obj_solid,false,false))inCone = false;
	if (distance_to_object(obj_player)<agroRange and inCone) {
	inTrack = true;
	inPatrol = false;
	}
	#endregion
	#region figure out paths
	if (inPatrol) {
		//if path isn't created, make it between our location and start point
		
		//if we reach the end of the path, make a new one to endpoint
		
		//if we reach the end of that path, make new one to startpoint
		
	}
	if (inAttack) {
		//every step, make a path to players location
		
		
	}
	if (inWander) {
		//make a path to random point	
	}
	#endregion
}
	//#endregion	
