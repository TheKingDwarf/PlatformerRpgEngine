/// @description ai code for a Melee type enemy
if (state = EnemyStates.frozen) {
	vx = 0;
	shader = shd_make_blue;
}
// do stuff based off inputs
if (state = EnemyStates.normal) {
	if (inDamage) { //damage gets checked first because it will cancel everything else
		
	} else {
		if (inAttack) {
			//attacking code?	
			
		} else {
			if (inJump){
				//check if ledge is within jump height
				//if so jump up to the top of it
				//if not turn around, reverse inputLeft/Right or figure out new way to player
			}
			if (inPatrol) {
				//if patrol walk along pattern until player is near	
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
					
				}
			}
			if (inTrack) {
				//if player is near, or was near a maximum of 30 seconds ago
				//try to plot a route through the level to the players x and y
				//avoid spikes, lava, falling and tall ledges
				//this is gonna be really fucking difficult eh
			}
			if (inLeft) {
				//sub some amount to vx	
				vx = Approach(vx,-spd,-0.2);
			}
			if (inRight) {
				//add some amount to vx	
				vx = Approach(vx,-spd,0.2);
			}
			
		}
	}
}
