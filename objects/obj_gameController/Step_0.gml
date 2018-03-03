if (keyboard_check_pressed(vk_add)) room_restart();

if (gamepad_is_connected(0)) {
	gamepad_set_axis_deadzone(0,.3)	
	
}


wind_sin+= 0.1;

wind_sin = clamp(wind_sin,0,359);

wind += dsin(wind_sin);

kLeft        = keyboard_check(ord("A")) or (gamepad_axis_value(0,gp_axislh) >.5);
kRight       = keyboard_check(ord("D")) or (gamepad_axis_value(0,gp_axislh)<-.5);
kUp          = keyboard_check(ord("W")) or (gamepad_axis_value(0,gp_axislv)<-.5);
kDown        = keyboard_check(ord("S")) or (gamepad_axis_value(0,gp_axislv)> .5);

kJump        =  keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0,gp_face1);
kJumpRelease = keyboard_check_released(vk_space)or gamepad_button_check_released(0,gp_face1);

kBut1		 = keyboard_check(ord("F")) or gamepad_button_check(0,gp_shoulderrb);
kBut2		 = keyboard_check(ord("1")) or gamepad_button_check(0, gp_face2);
kBut3		 = keyboard_check(ord("2")) or gamepad_button_check(0, gp_face3);
kBut4		 = keyboard_check(ord("3")) or gamepad_button_check(0, gp_face4);

//parallax background layers

var player_vx_clamped = clamp(obj_player.vx,-1,1)

for (var i = 0; i < ds_list_size(bg_layers);i++) {
	layer_hspeed(bg_layers[| i],(1/(2+i))*obj_player.vx);	
	layer_x(bg_layers[| i],obj_camera.x);
	layer_y(bg_layers[| i],obj_camera.y);	
}

