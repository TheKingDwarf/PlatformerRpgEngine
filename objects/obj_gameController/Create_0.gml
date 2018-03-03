paused = false;
enum collectableTypes {
	coin=0,
	heal=1,
	spel=2	
}
enum collectableStates {
	Init=0,
	Fall=1,
	Coll=2,
	Grab=3
}

wind = 1; // wind for decor objects
wind_sin = 0;


kLeft = 0;
kRight= 0;
kUp= 0;
kDown= 0;
kJump= 0;
kJumpRelease= 0; 
tempAccel= 0;
tempFric= 0;
kBut1= 0;
kBut2= 0;
kBut3= 0;
kBut4= 0;

bg_layers = ds_list_create();





