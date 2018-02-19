/// @description 
splits = ds_list_create();
var r = irandom_range(96, 255);
color = make_colour_rgb(r, r, 255);
fadeTime = (7) + irandom(2);
alpha = 1;
targetX = 0;
targetY = 0;
parent = obj_player;