/// @description control game
if (global.pause) {
	//pause menu	
}

if(not global.pause) {
	#region Music
	// music
	if(alarm[0] == -1 and global.this_track != global.next_track) {
		if(global.this_track != noone) { // fade out this track
			audio_sound_gain(global.this_track, 0, global.music_fade*1000);
		}
		alarm[0] = global.music_fade*room_speed ; // remove and swap tracks
	}
	#endregion Music
	
	#region Screen follow user
	// screen follow user
	if(instance_exists(global.player)) {
		if(global.camera_follow_player) {
			
			//Resize view based on speed
			var _dist = point_distance(
				0,
				0,
				global.player.hspd,
				0//global.player.vspd
			);
			global.camera_zoom += _dist;
			global.camera_zoom = lerp(global.camera_zoom, 0, .1);
			camera_set_view_size(
				view_camera[0],
				global.camera_w + global.camera_zoom,
				global.camera_h + global.camera_zoom / global.base_aspect
			);
			
			//Half view size
			var _vw = camera_get_view_width(view_camera[0]) / 2;
			var _vh = camera_get_view_height(view_camera[0]) / 2;
	
			//Screenshake
			if(global.screenshake > 0) {
				global.screenshake -= 0.5;
				global.screenshake = clamp(global.screenshake, 0, 10);
				_vw += irandom_range(-global.screenshake, global.screenshake);
				_vh += irandom_range(-global.screenshake, global.screenshake);
				
				gamepad_set_vibration(0,global.screenshake/2,global.screenshake/2);
			} else {
				gamepad_set_vibration(0,0,0);
			}
	
			//Look ahead
			var _maxAhead = 4;
			global.camera_ahead = lerp(global.camera_ahead, global.player.draw_dir*_maxAhead,.25);
			
			var _xTo = global.player.x + global.camera_ahead;
			var _yTo = global.player.y - 16;

			x += (_xTo-x)*global.camera_speed;
			y += (_yTo-y)*global.camera_speed;
			
			camera_set_view_pos(view_camera[0], x - _vw, y - _vh);
		}
		else {
			x = global.player.x
			y = global.player.y
		}
		
		#region parallax background
		
		var _bg_scale = (global.camera_w + global.camera_zoom)/global.camera_w;
		var _ycenter = camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2
		var _xcenter = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2
		
		if (layer_exists("Background")){
		var _ylerp = _bg_scale * (_ycenter-50)/room_height
		var _xlerp = _bg_scale * (_xcenter)/room_width
		layer_y("Background", camera_get_view_y(view_camera[0]) - 50*_ylerp);
		layer_x("Background", camera_get_view_x(view_camera[0]) - 200*_xlerp);
		var back_id = layer_background_get_id(layer_get_id("Background"));
		layer_background_xscale(back_id, _bg_scale);
		layer_background_yscale(back_id, _bg_scale);
		}
		
		if (layer_exists("Background_1")){
		layer_y("Backgrounds_1", camera_get_view_y(view_camera[0]) - 60*_ylerp);
		layer_x("Backgrounds_1", camera_get_view_x(view_camera[0]) - 300*_xlerp);
		var back_id = layer_background_get_id(layer_get_id("Backgrounds_1"));
		layer_background_xscale(back_id, _bg_scale);
		layer_background_yscale(back_id, _bg_scale);
		}
		
		if (layer_exists("Background_2")){
		layer_y("Backgrounds_2", camera_get_view_y(view_camera[0]) - 70*_ylerp);
		layer_x("Backgrounds_2", camera_get_view_x(view_camera[0]) - 400*_xlerp);
		var back_id = layer_background_get_id(layer_get_id("Backgrounds_2"));
		layer_background_xscale(back_id, _bg_scale);
		layer_background_yscale(back_id, _bg_scale);
		}
		
		if (layer_exists("Background_3")){
		layer_y("Backgrounds_3", camera_get_view_y(view_camera[0]) - 80*_ylerp);
		layer_x("Backgrounds_3", camera_get_view_x(view_camera[0]) - 500*_xlerp);
		var back_id = layer_background_get_id(layer_get_id("Backgrounds_3"));
		layer_background_xscale(back_id, _bg_scale);
		layer_background_yscale(back_id, _bg_scale);
		}
		#endregion parallax background
		
	}
	else {
		global.player = instance_find(obj_player, 0);
		if(global.player) {
			x = global.player.x
			y = global.player.y	
		}
	}
	#endregion Screen follow user


}