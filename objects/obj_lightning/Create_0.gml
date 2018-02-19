/// @description 
splits = ds_list_create(); // list of splits, these are all the arcs in the lightning
var r = irandom_range(96, 255);
color = make_colour_rgb(r, r, 255);//random color
fadeTime = (7) + irandom(2);//time it takes to fade
alpha = 1;//alpha counter
targetX = 0;//point to end at
targetY = 0;//point to end at
parent = obj_player;

//set layers
dam_layer = layer;
layer = global.FXlayer;
