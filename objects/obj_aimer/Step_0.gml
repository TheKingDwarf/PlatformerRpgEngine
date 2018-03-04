/// @description 
accel += 0.5;
if (accel > 15) accel = 15;
if ((mouse_check_button_released(mb_left)or gamepad_button_check_released(0,gp_shoulderrb))) instance_destroy();
if (gamepad_is_connected(0)) {
	
	var h = gamepad_axis_value(0, gp_axislh);
	var v = gamepad_axis_value(0, gp_axislv);
	var on = sign(abs(gamepad_axis_value(0,gp_axisrh)+gamepad_axis_value(0,gp_axisrv)))+1;//if right stick, aim quicker
	accel = accel * (abs(sign(h+v)));
	var rightStickDirection = point_direction(x,y,x+h,y+v);
	
	x += lengthdir_x(accel*on,rightStickDirection);
	y += lengthdir_y(accel*on,rightStickDirection);
	
} else {
x = mouse_x;
y = mouse_y;
	
}

