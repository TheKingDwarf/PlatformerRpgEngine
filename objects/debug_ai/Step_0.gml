/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(ord("O"))) {
	current_point = 0;
	generate_path(mouse_x,mouse_y, nav, c_path);
	show_debug_message(string(c_path[| 0]));
}

var point_id = c_path[| current_point];
var next_x = point_id.x;
var next_y = point_id.y;

if (link_type = 0) {

	if (x != next_x and y != next_y) {
	
		if (y > next_y) {
			link_type = 0; // jump
		} else {
	
			if (x < next_x) {
				if (y = next_y) {
				link_type = 1;//right
				}
			} 
			if (x > next_x) {
				if (y = next_y) {
				link_type = 2;//left
				}
			}
			
		}
	} else {
		current_point++;
		link_type = 0;
	}
}

if (x != next_x and y != next_y) {
	switch (link_type) {
		case 0:
			jump_trajectory( next_y, next_x, vxMax, vyMax, false, 0);
			link_type = 3;
			break;
		case 1:
			if (x != next_x) vx = Approach(vx, vxMax, groundAccel);
			break;
		case 2:
			if (x != next_x) vx = Approach(vx, -vxMax, groundAccel);
			break;
		case 3:
			break;
	}
} else {
	current_point++;
	link_type = 0;
}

if (!onGround) {
	vy = Approach(vy , vyMax, gravNorm);		
}



 

	