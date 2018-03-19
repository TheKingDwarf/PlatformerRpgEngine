/// @description generate_tilemap(tile_size)
/// @param tile_size

//generates a ds_grid that represents the level. at each point, it measures whether there is a wall object.
// the space between points is tile_size
var tile_size = argument0;
var tilemap_grid = ds_grid_create(room_width/tile_size,room_height/tile_size);

for (var i = 0; i < room_width/tile_size;i++) { // x loop
	for (var k = 0; k < room_height/tile_size;i++) {	//y loop
		if (instance_place(i*tile_size,k*tile_size,obj_solid)) { // if collision at x and y, mark tile as full
			tile_size[# i,k] = 1;
		} else { // otherwise mark it open
			tile_size[# i,k] = 0;	
		}
	}
}

return tilemap_grid;