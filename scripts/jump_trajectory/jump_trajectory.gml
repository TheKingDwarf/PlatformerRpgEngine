///@description jump_trajectory(target_y,target_x,vxMax,vyMax,testing,object)
///@param target_y
///@param target_x
///@param vxMax
///@param vyMax
///@param testing(boolean)
///@param object_index
//this script is to calculate a vspd and hspd that an object can use to jump to any platform
//if in testing mode (testing = true), it just returns true or false depending on whether the jump
//is possible.
//object_index is if we are in testing mode, so we know what object to test

//HUGE THANKS TO MESETA ON THE DISCORD SERVER FOR WRITING THE INITIAL VERSION OF THIS SCRIPT
// AND DOING A LOT OF CALCULUS FOR ME
gml_pragma("forceinline")
//init variables
var target_y = argument0;
var target_x = argument1;
var maxVx    = argument2;
var maxVy	 = argument3;
var testing  = argument4; //testing should be a boolean
var object	 = argument5;
//some base calculations
if (!testing) { // if we are not testing, we are running this in the object, and can just use some values we now the object will have
	var d = target_x-x+sprite_width/2;	
	var h = abs(target_y-y);

	var g = gravNorm;

	var ok = false;
	while(ok == false) {
		var vspd = -sqrt(2*g*h)-random_range(0.01, 0.5);//this is the base amount needed to make the jump, plus some random
		var hspd = d*g/(-vspd + sqrt(vspd*vspd-2*g*h));//the neccesary hspd to stick the landing
	
		if ((vspd < -sqrt(power(g*sprite_width/(2*hspd), 2) + 2*g*h))) {//makes sure vspd is enough to not clip the platform
			ok = true;//break loop
		}
		
	}
	if (hspd <= maxVx and vspd <= maxVy) {//if we are within our constraints
		vx = hspd;//set the values
		vy = vspd;
	} else {
		return false;
	}
} else {
	var d = target_x-object.x+object.sprite_width/2;
	var h = abs(target_y-object.y);
	
	var g = object.gravNorm;
	while(ok == false) {
		var vspd = -sqrt(2*g*h)-random_range(0.01, 0.5);//this is the base amount needed to make the jump, plus some random
		var hspd = d*g/(-vspd + sqrt(vspd*vspd-2*g*h));//the neccesary hspd to stick the landing
	
		if ((vspd < -sqrt(power(g*object.sprite_width/(2*hspd), 2) + 2*g*h))) {//makes sure vspd is enough to not clip the platform
			ok = true;//break loop
		}
		
	}
	if (hspd <= maxVx and vspd <= maxVy) {//if we are within our constraints
		return true;//return that the arc works
	} else {
		return false;
	}
	
}


