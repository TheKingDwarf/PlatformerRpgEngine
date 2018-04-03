/// @description generate_tilemap(tile_size)
/// @param tile_size
gml_pragma("forceinline");
//generates a ds_grid that represents the level. at each point, it measures whether there is a wall object.
// the space between points is tile_size
var tile_size = argument0;
var width	= room_width/tile_size;
var height	= room_height/tile_size;
var tilemap_grid = ds_grid_create(width+1,height+1);
show_debug_message(string(width))
show_debug_message(string(height))

for (var i = 0; i < width;i++) { // x loop
	for (var k = 0; k < height;k++) {	//y loop
		if (instance_place(i*tile_size,k*tile_size,obj_solid)) { // if collision at x and y, mark tile as full
			tilemap_grid[# i,k] = 1;
		} else { // otherwise mark it open
			tilemap_grid[# i,k] = 0;	
		}
	}
}

return tilemap_grid;