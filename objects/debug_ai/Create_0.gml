/// @description Insert description here
// You can write your code in this editor
nav = generate_navmesh( obj_gameController.tilemap, 16, debug_ai);

m = 1.6;
//still needs tweaking
groundAccel = .7  * m;
groundFric  = 1.9  * m;
airAccel    = 0.55 * m;
airFric     = 1.9 * m;
vxMax       = 8.0  * m;
vyMax       = 14.0 * m;
jumpHeight  = 12.0  * m;
gravNorm    = 0.9  * m;
gravSlide   = 0.25 * m; 

clingTime   = 4.0 * m;
canJump = 0;
knockback = 0;
knockup = 0;
imm_frames = 0;
c_path = 0;
current_point = 0;
link_type = 0;//the link type between the last point and current point
onGround = 0;
generate_path(355,y, nav, c_path);