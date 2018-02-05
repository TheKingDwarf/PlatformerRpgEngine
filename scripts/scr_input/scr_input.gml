//global input script. gets the basic inputs that game objects might need. Additional inputs should be created
// in the object that needs them.

if (gamepad_is_connected(0)){
var inputRight = .5       ;
var inputLeft  = -.5      ;	
var inputUp	   = .5       ;
var inputDown  = -.5      ;	
var inputSpace = gp_face1 ;	
var inputKB1   = gp_face2 ;	
var inputKB2   = gp_face3 ;
var inputKB3   = gp_face4 ;
var inputKB4=gp_shoulderrb;

var axis_value_V = gamepad_axis_value(0,gp_axislv);
var axis_value_H = gamepad_axis_value(0,gp_axislh);

if (axis_value_H >= inputRight) {
global.inputRight = true;
} else if (axis_value_H <= inputLeft) {
global.inputLeft  = true;
}

if (axis_value_H >= inputUp) {
global.inputUp = true;
} else if (axis_value_H <= inputDown) {
global.inputDown  = true;
}

if (gamepad_button_check_pressed(0,inputKB1)) global.inputKB1 = true;
if (gamepad_button_check_pressed(0,inputKB2)) global.inputKB2 = true;
if (gamepad_button_check_pressed(0,inputKB3)) global.inputKB3 = true;
if (gamepad_button_check_pressed(0,inputKB4)) global.inputKB4 = true;

} else {
var inputRight = ord("D");	
var inputLeft  = ord("A");	
var inputUp	   = ord("W");
var inputDown  = ord("S");	
var inputSpace = vk_space;	
var inputKB1   = vk_up   ;	
var inputKB2   = vk_left ;
var inputKB3   = vk_right;
var inputKB4   = vk_down ;

if (inputRight) global.inputRight = true;
if (inputLeft) global.inputLeft = true;	
if (inputUp) global.inputUp = true;
if (inputDown) global.inputDown = true;

if (inputKB1) global.inputKB1 = true;
if (inputKB2) global.inputKB2 = true;
if (inputKB3) global.inputKB3 = true;
if (inputKB4) global.inputKB4 = true;
}


