/// @description Initalize Game


//load save file
//application_surface_draw_enable(false);

//create control objects
instance_create_layer(x,y,"Instances",obj_gameController);
instance_create_layer(x,y,"Instances",obj_audioController);
//play startup sounds/animations


global.monitor_w = display_get_width();
global.monitor_h = display_get_height();



global.scale_factor = global.monitor_w/640;

if (global.scale_factor != round(global.scale_factor)) global.scale_factor = floor(global.scale_factor);
show_debug_message(string(global.scale_factor))
global.monitor_w = 640*global.scale_factor;
global.monitor_h = 360*global.scale_factor;

//surface_resize(application_surface,global.monitor_w,global.monitor_h);
window_set_size(global.monitor_w,global.monitor_h)
alarm[0] = 1;
window_set_min_height(global.monitor_h);
window_set_min_width(global.monitor_w);
//initalize any global variables

