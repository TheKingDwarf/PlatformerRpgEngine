/// @description generate_navmesh(tilemap, tileSize, accel, maxSpeed, jumpSpeed, jumpHeight, gravity)
/// @param tilemap
/// @param tileSize
/// @param accel
/// @param maxSpeed
/// @param jumpSpeed
/// @param jumpHeight
/// @param gravity
//generates a navmesh for an enemy ai to use to navigate a level
//this includes paths for left to right movement, falling and jumping

//this operation is expensive and should be used minimally

var tilemap		= argument0;
var tileSize	= argument1;
var accel		= argument2;
var maxSpeed	= argument3;
var jumpSpeed	= argument4;
var jumpHeight	= argument5;
var Gravity		= argument6;


//------------------------------------------------------------------------------------------------
//initialize navmesh, with none points in every grid pocket
var width	= room_width/tileSize;
var height	= room_height/tileSize;
var navmesh = ds_grid_create(width,height);

for (var i = 0; i < width; i++) // loop through width and height
for (var k = 0; k < height; k++) {
	var current_point	= instance_create( i*tileSize, k*tileSize, navPoint)
	navmesh[# i, k]		= current_point; // make a nav point and store its id in the navmesh
}

//------------------------------------------------------------------------------------------------
//define walkable navpoints

// for the purpose of this code, a platform means 1 or more adjacent blocks that are all on the same tile row
/*

The cool thing about our tilemap is that it is stored in a ds_grid
in this form (tilemap[# i (x or width or column),k (y or height or row)])
this means that we can easily check any adjacent tiles for collisions
by adding or subtracting from i or k

*/
var actualPlatformIndex = 0;
var platformStarted = false;
var point_id = noone;
for (var k = 0; k < height;k++)  {//these loops are backwards from the other ones because its easier for finding the
	
	platformStarted = false;//everytime we move to a different row, reset this variable
	
	for (var i = 0; i < width; i++) {//walkable navpoint
		#region determine what type of navpoint we have
		if (!platformStarted) { // if we haven't started a platform
			if (tilemap[# i, k]		= 0 // if target tile is free
			and tilemap[# i, k+1]	= 1)// and lower one is not
			{							// then the tile is the start of a left edge of a platform
				platformStarted = true; // the platform is now started, because we have the left edge of it
										// however, we dont set the point to left edge yet, because it could be solo
			}
		}
		
		if (platformStarted) { //if we have started a platform
			//first check the tile to the right to make sure its part of the platform
			if (tilemap[# i+1, k]		= 0 // if right is free
			and tilemap[# i+1, k+1]	= 1)// and right lower is filled
			{ 
				var point_id = navmesh[# i-1, k]
				if (point_id.type == navpointTypes.leftEdge)// check if the tile behind us is already a left edge
				{ // if it is, this must be a normal platform
					point_id = navmesh[# i, k] 	//so we store its id
					point_id.type = navpointTypes.platform;//and set the type of that navpoint to a normal platform
				}
				else//otherwise it must be a left edge
				{
					point_id = navmesh[# i, k] 	//so we store its id
					point_id.type = navpointTypes.leftEdge;//and set the type of that navpoint to leftEdge
				}
			}
			
			if (tilemap[# i+1, k]		= 1 // if the right tile is full
			or  tilemap[# i+1,k+1]		= 0)// or if bottom right is empty
			{	
				
				point_id = navmesh[# i, k] 	//so we store its id to check two things
				if (point_id.type = navpointTypes.leftEdge) { //if it was already a left edge, it must be a solo
					point_id.type = navpointTypes.solo;//set the type of that navpoint to solo
				} else { //otherwise it must be a right edge, so
					point_id.type = navpointTypes.rightEdge;//set the type of that navpoint to rightEdge	
				}
				platformStarted = false//either way that platforms done
			}
			
		}
	#endregion

	}
}
//------------------------------------------------------------------------------------------------
//make fall and walk links
//we want fall, walk and jump links so that each point has a "pointer" to the next spot if you need it
//jump links are complex so they're in the own loop to make the code cleaner
for (var i = 0; i < width; i++) 
for (var k = 0; i < height; k++) {
	point_id = navmesh[# i, k];
	
	if (point_id.type != navpointTypes.none) { // if we are on a platform
		if (navmesh[# i+1, k].type != navpointTypes.none) { //if there is a platform to the right
			point_id.linkRight	= navmesh[# i+1, k];
		} else { // make a fall link
			var j = 1;
			while (navmesh[# i+1, k+j] == navpointTypes.none) { // while the fall target is not a collision with the ground, move target lower
				j++;
			}
		}
		
		if (navmesh[# i-1, k].type != navpointTypes.none) { // if there is a platform to the left
			point_id.linkLeft	= navmesh[# i-1, k];	
		} else { // make a fall link
			var j = 1;
			while (navmesh[# i-1, k+j] == navpointTypes.none) { // while the fall target is not a collision with the ground, move target lower
				j++;
			}		
		}
	}
}
//------------------------------------------------------------------------------------------------
//make jump trajectories
