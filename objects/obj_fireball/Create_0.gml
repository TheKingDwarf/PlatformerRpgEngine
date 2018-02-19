/// @description 

// Inherit the parent event
damage = 2;
dir = 0;
spd = 20;
parent = obj_player;
alarm[0] = 60;
//sprite_index = choose(spr_fireball_1,spr_fireball_2,spr_fireball_3);

show_debug_message("created");

dam_layer = layer;
layer = global.FXlayer;