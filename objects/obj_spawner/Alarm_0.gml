/// @description Insert description here
// You can write your code in this editor
if (amount = -1) { //if unlimited spawner
	instance_create(x,y, object);
	
} else {
	if (amount > 0) {
		amount--;		
	} else {
		instance_destroy();	
	}
}

alarm[0] = irandom_range(min_time,max_time);