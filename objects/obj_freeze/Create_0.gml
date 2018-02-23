/// @description 
damage = 1;
dir = 0;
spd = 15;
parent = obj_player;
alarm[0] = 120;



dam_layer = "Instances";
layer = global.FXlayer;
part = part_system_create_layer(global.FXlayer,false);
fire_p = part_type_create();
var whi = make_color_rgb(255,255,255);
var blu = make_color_rgb(95,205,228);
part_type_color2(fire_p,whi,blu);
part_type_shape(fire_p,pt_shape_pixel);
part_type_life(fire_p,room_speed/12,room_speed/6);
part_type_size(fire_p,1,4,-.2,0)
part_type_alpha2(fire_p,1,0)
part_type_blend(fire_p,true);