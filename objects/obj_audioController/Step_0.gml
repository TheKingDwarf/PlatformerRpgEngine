/// @description 
#region fade
	// music
if(this_track != next_track) {
	if(alarm[0] == -1 ) {
		if(this_track != noone) { // fade out this track
			audio_sound_gain(this_track, 0, music_fade*1000);
		}
		alarm[0] = music_fade*room_speed ; // remove and swap tracks
	}
}
#endregion fade

if (intro > 0) {
	if (audio_sound_get_track_position(this_track) > intro+music_length) {
		var pos = audio_sound_get_track_position(this_track);
		var len = audio_sound_length(this_track);
		audio_sound_set_track_position(this_track,len-music_length);
	}
	
}