/// @description 
draw_set_colour(color);
draw_set_alpha(alpha);
gpu_set_blendmode(bm_max);
var currentX = x, currentY = y;
for(var i = 0; i < ds_list_size(splits); i += 2)
{
    var nextX = splits[| i], nextY = splits[| i + 1];
    draw_line(currentX, currentY, nextX, nextY);
    currentX = nextX;
    currentY = nextY;
}
draw_line(currentX, currentY, targetX, targetY);

draw_set_color(c_white)
draw_set_alpha(1);
gpu_set_blendmode(bm_normal);