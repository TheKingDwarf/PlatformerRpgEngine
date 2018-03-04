/// @description 
this_track = noone;

next_track = noone;
// all values in seconds
intro = 0; //if we have an intro, set this to the length of the intro

music_length = 0;//set this to the length of the main part of the music
music_fade = 2;
music_volume = 100;



//the music will have to have two loops of the main part of the music

//array of music for different rooms, number is position in room resource tree
room_music = array_create(room_last+1, undefined);
room_music[rm_1] = mus_plains;
room_music[rm_2] = mus_plains;
room_music[rm_level_1] = mus_plains;