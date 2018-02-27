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

snd = audio_play_sound(snd_lightning_player,1,false)
audio_sound_pitch(snd,random_range(0,3));
audio_sound_gain(snd,random_range(.3,.7),5)