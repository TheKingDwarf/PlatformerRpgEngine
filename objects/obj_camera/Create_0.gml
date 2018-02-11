/// @description 
camera = camera_create();
//whole damn thing needs redoing
screenshake = 0;
camera_zoom = 0;

var sizeX = 640;
var sizeY = 360;

mainCamera = camera_create_view(x,y,sizeX,sizeY,0, self, -1, -1, sizeX, sizeY);
view_camera[0] = mainCamera;
//surface_resize(application_surface,sizeX,sizeY);

follow = obj_player; // object following
xTo = x;//x to move to
yTo = y;//y to move to
