/// @description 
if(this_track) {
	audio_stop_sound(this_track);
}

if(next_track) {
	audio_sound_gain(next_track, 0, 0);
	audio_sound_gain(next_track, music_volume, 1000/2);
	audio_play_sound(next_track, 1, true);
}

this_track = next_track
