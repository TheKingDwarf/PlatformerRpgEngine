/// @description 
part_system_destroy(part)
part_type_destroy(fire_p)
instance_create_layer(x,y,global.FXlayer,obj_fireball_explode)
audio_play_sound(snd_explode_player,1,false)