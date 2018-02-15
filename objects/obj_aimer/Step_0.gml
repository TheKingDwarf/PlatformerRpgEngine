/// @description 
accel += 0.5;
if (accel > 9) accel = 9;
if (!obj_gameController.kBut1) instance_destroy();
if (gamepad_is_connected(0)) {
	
	var h = gamepad_axis_value(0, gp_axislh);
	var v = gamepad_axis_value(0, gp_axislv);
	
	accel = accel * (abs(sign(h+v)));
	var rightStickDirection = point_direction(x,y,x+h,y+v);
	
	x += lengthdir_x(accel,rightStickDirection);
	y += lengthdir_y(accel,rightStickDirection);
} else {
x = mouse_x;
y = mouse_y;
	
}
x = floor(x);
y = floor(y);
show_debug_message(string(x))