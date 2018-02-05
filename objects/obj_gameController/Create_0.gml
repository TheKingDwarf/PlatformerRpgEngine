/// @description global variables

// pause stuff
global.pause = false
pause_object = noone

// music
global.next_track = noone
global.this_track = noone
global.music_fade = 1.5 // music fade time
global.music_volume = 0.2

// camera and screen stuff
global.base_w = 320;
global.base_h = 180;
global.base_aspect = global.base_w/global.base_h;
global.camera_w = global.base_w / 2;
global.camera_h = global.base_h / 2;
global.camera_speed = 1;
global.camera_follow_player = true;
global.camera_ahead = 0;
global.screenshake = 0;
global.camera_zoom = 0;//+ = zoomed out, - = zoomed in.
global.collectibles = 0;
// player
global.player = obj_player;

// for shaders and stuff
application_surface_draw_enable(false);

display_set_gui_size(160,90);

sine = 0;

