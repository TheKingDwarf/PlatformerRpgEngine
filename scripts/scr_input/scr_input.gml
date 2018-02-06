//global input script. gets the basic inputs that game objects might need. Additional inputs should be created
// in the object that needs them.



var kLeft, kRight, kUp, kDown, kJump, kJumpRelease, tempAccel, tempFric, kBut1, kBut2, kBut3, kBut4;

kLeft        = keyboard_check(ord("A")) or (gamepad_axis_value(0,gp_axislh) >.5);
kRight       = keyboard_check(ord("D")) or (gamepad_axis_value(0,gp_axislh)<-.5);
kUp          = keyboard_check(ord("W")) or (gamepad_axis_value(0,gp_axislv)<-.5);
kDown        = keyboard_check(ord("S")) or (gamepad_axis_value(0,gp_axislv)> .5);

kJump        =  keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0,gp_face1);
kJumpRelease = keyboard_check_released(vk_space)or gamepad_button_check_released(0,gp_face1);

kBut1		 = mouse_check_button(mb_left) or gamepad_button_check(0,gp_shoulderrb);
kBut2		 = keyboard_check(ord("1")) or gamepad_button_check(0, gp_face2);
kBut3		 = keyboard_check(ord("2")) or gamepad_button_check(0, gp_face3);
kBut4		 = keyboard_check(ord("3")) or gamepad_button_check(0, gp_face4);



