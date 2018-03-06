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

	//kLeft = keyboard_check(vk_left)
	//kRight = keyboard_check(vk_right)
	//kJump = keyboard_check(vk_up)
	//kJumpRelease = keyboard_che,ck_released(vk_up)
	if (current_point = undefined) current_point=0;
	if (current_point > 2*instance_number(par_patrol_point)){
		if (inPatrol) ds_list_flip(point_list);
		
	};
	//try to find a route between points
	targetX = ds_list_find_value(point_list,current_point)
	targetY = ds_list_find_value(point_list,current_point+1);
	
	//inputs
	var kRight = false;
	var kLeft = false;
	var kJump = false;
	
	if (targetX > x){
		kRight = true;
		image_xscale = 1;
	}
	if (targetX < x) {	
		image_xscale = -1;	
		kLeft = true;
	}
	if (targetY < y) kJump = true;
	
	
	
	if (point_distance(x,y,targetX,targetY)<=8)current_point+=2;
	
	if (keyboard_check_pressed(vk_left))current_point+=2;
	
	if (keyboard_check_pressed(vk_right))current_point-=2;
	
	
	/*
	All this code works, but the point array is all messed up. i'f we figure out how to get our point array
	working, we will be in business
	
	*/
	
	
	
	
	#region state = run

// Movement ///////////////////////////////////////////////////////////////////
//update
		cLeft  = place_meeting(x - 1, y, obj_solid);
		cRight = place_meeting(x + 1, y, obj_solid);
		// Apply the correct form of acceleration and friction
		if (onGround) {
		    tempAccel = groundAccel;
		    tempFric  = groundFric;

		} else {
		    tempAccel = airAccel;
		    tempFric  = airFric;
		}

		// Reset wall cling
		if ((!cRight && !cLeft) || onGround) {
		    canStick = true;
		    sticking = false;
		}   

		// Cling to wall
		if (((kRight && cLeft) || (kLeft && cRight)) && canStick && !onGround) {
		    alarm[0] = clingTime;
		    sticking = true; 
		    canStick = false;       
		}

		// Handle gravity
		if (!onGround) {
		    if ((cLeft || cRight) && vy >= 0) {
		        // Wall slide
		        vy = Approach(vy, vyMax, gravSlide);
		    } else {
		        // Fall normally
		        vy = Approach(vy, vyMax, gravNorm);
		    }
		}

		// Left 
		if (kLeft && !kRight && !sticking) {
		    // Apply acceleration left
		    if (vx > 0)
		        vx = Approach(vx, 0, tempFric);   
		    vx = Approach(vx, -vxMax, tempAccel);
		}

		// Right 
		if (kRight && !kLeft && !sticking) {
		    // Apply acceleration right
		    if (vx < 0)
		        vx = Approach(vx, 0, tempFric);   
		    vx = Approach(vx, vxMax, tempAccel);
		}

		// Friction
		if (!kRight && !kLeft)
		    vx = Approach(vx, 0, tempFric); 
        
		// Wall jump
		if (kJump && cLeft && !onGround & canJump) {
			canJump = false;
		    if (kLeft) {
		        vy = -jumpHeight * 1.1;
		        vx =  jumpHeight * .35;
		    } else {
		        vy = -jumpHeight * 1.1;
		        vx =  vxMax * 0.75;
		    }  
		}

		if (kJump && cRight && !onGround & canJump) {
			canJump = false;
		    if (kRight) {
		        vy = -jumpHeight * 1.1;
		        vx = -jumpHeight * .35;
		    } else {
		        vy = -jumpHeight * 1.1;
		        vx = -vxMax * 0.75;
		    }  
		}
 
		// Jump 
		if (kJump) { 
		    if (onGround)
		        vy = -jumpHeight;
		    // Variable jumping
		}	
	
	
	
}
	#endregion	
