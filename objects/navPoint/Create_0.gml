/// @description This object stores variables
platformIndex = noone;

type = navpointTypes.none;

//stores indexes of other points the point can be connected to
linkLeft = noone;//point you can move left to

linkRight = noone;//point you can move right to

linkFall = noone;//point you can fall to

jumpLinks = ds_list_create();//we need a whole list of these buggers
