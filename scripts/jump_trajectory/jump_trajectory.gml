///@description jump_trajectory(target_y,target_x,vxMax,vyMax)
///@param target_y
///@param target_x
///@param vxMax
///@param vyMax
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
//some base calculations
if (abs(target_y-y) < maxVy){ // if we are not testing, we are running this in the object, and can just use some values we now the object will have
	var d = target_x-x+sprite_width/2;	
	var h = abs(target_y-y);

	var g = grav;

	var ok = false;
	while(ok == false) {
		var _vspd = -sqrt(2*g*h)-random_range(0.01, 0.5);//this is the base amount needed to make the jump, plus some random
		var _hspd = d*g/(-_vspd + sqrt(_vspd*_vspd-2*g*h));//the neccesary hspd to stick the landing
	
		if ((_vspd < -sqrt(power(g*sprite_width/(2*_hspd), 2) + 2*g*h))) {//makes sure vspd is enough to not clip the platform
			ok = true;//break loop
		}
		
	}
	if (_hspd <= maxVx) {//if we are within our constraints
		hspd = _hspd;//set the values
		vspd = _vspd;
	} else {
		return false;
	}

} else return false;


