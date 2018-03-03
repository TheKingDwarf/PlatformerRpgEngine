/// @description 
if (imm_frames > 0) {
	if (imm_frames % 2 == 1) {
		shader_set(shd_make_white);
	
	} else {
			shader_reset();
	}
	imm_frames--;
} 
if (shader != 0) shader_set(shader);
draw_self();
shader_reset();
var col = c_white;
var modif = 0; //is image_xscale negative
if (image_xscale = -1) modif = 180-visionCone;
//calculate whetehr or not player is in view cone
var point1X = lengthdir_x(agroRange,modif)+x
				
var point2X = lengthdir_x(agroRange,modif+visionCone)+x;
var point1Y = lengthdir_y(agroRange,modif)+y;
var point2Y = lengthdir_y(agroRange,modif+visionCone)+y;
draw_set_alpha(0.2)
if (point_in_triangle(obj_player.x,obj_player.y,x,y,point1X,point1Y,point2X,point2Y))col = c_green;
if(needsSight)
if (collision_line(x,y-1,obj_player.x,obj_player.y,obj_solid,false,false))col = c_white;
draw_triangle_color(x,y,point1X,point1Y,point2X,point2Y,col,col,col,false)
draw_set_alpha(1);