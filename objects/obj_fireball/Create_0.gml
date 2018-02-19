/// @description 

// Inherit the parent event
damage = 2;
dir = 0;
spd = 20;
parent = obj_player;
alarm[0] = 60;
sprite_index = choose(spr_fireball1,spr_fireball2,spr_fireball3);

show_debug_message("created");

dam_layer = layer;
layer = global.FXlayer;
part = part_system_create_layer(global.FXlayer,false);
fire_p = part_type_create();
var red = make_color_rgb(172,50,50);
var yel = make_color_rgb(251,242,54);
part_type_color2(fire_p,yel,red);
part_type_shape(fire_p,pt_shape_pixel);
part_type_life(fire_p,room_speed/6,room_speed);
part_type_size(fire_p,1,4,-.2,0)
part_type_alpha2(fire_p,1,0)
part_type_blend(fire_p,true);