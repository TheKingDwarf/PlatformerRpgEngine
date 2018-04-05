/*//generate_path(targetX,targetY,navmesh,list name)
///@description makes a path between two points given a navmesh
///@param targetX
///@param targetY
///@param navmesh
///@param list name
gml_pragma("forceinline");	// add this here, because we want this script running really quickly
							//and compiling inline helps the performance slightly
var targetX = floor(argument0/TILE_SIZE); //where we want to end up
var targetY = floor(argument1/TILE_SIZE);
var navmesh = argument2; //navmesh we are using

var list_of_points_output	= ds_list_create(); //this is the final list of points to move between
var points_to_test			= ds_list_create(); //temporary list used to store all points we need to test for eligibility to be added to the final list
var k						= 0; // grid height for navmesh
var i						= 0; // grid width for navmesh
var current_point_id		= navmesh[# i, k];

var startX				= floor(x/TILE_SIZE); //floor x/16 to get our coordinate in the navmesh
var startY				= floor(y/TILE_SIZE);

var currentX			= startX;
var currentY			= startY;

var best_temp = noone;

var failsafe			= 1000; //emergency break if the while loop goes to long (if it needs a thousand iterations, we probably can't reach the point

while (currentX != targetX and currentY != targetY){
	//failsafe measures
	failsafe--;
	if (failsafe <= 0) {
		break;
		return false;
	}
	
	//add possible points to list
	i = currentX;
	k = currentY;
	current_point_id = navmesh[# i, k];
	if (current_point_id = noone) exit;
	
	ds_list_copy(points_to_test,current_point_id.links);
	
	//test points

	for (var j = 0; j < ds_list_size(points_to_test); j++) { // loop through all points we are testing
		var other_point_id	= points_to_test[| j];
		var x_distance		= abs(targetX - current_point_id.x/TILE_SIZE)
		var y_distance		= abs(targetY - current_point_id.y/TILE_SIZE)
		
		if (best_temp != noone) {
		var best_distance = abs(targetX - best_temp.x/TILE_SIZE)+abs(targetY - best_temp.y/TILE_SIZE)
		} else {
			best_distance = 1000000;	
		}
		if (x_distance+ y_distance < best_distance) { // if current_point_is closer to target
				best_temp = other_point_id;
		}
		
	}
	ds_list_add(list_of_points_output,current_point_id);
	current_point_id = best_temp;
	currentX = current_point_id.x/TILE_SIZE;
	currentY = current_point_id.y/TILE_SIZE;
}
if (best_temp != noone)
ds_list_add(list_of_points_output,best_temp)//add the last point

return ds_list_copy(argument3,list_of_points_output);