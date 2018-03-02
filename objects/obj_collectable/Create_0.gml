/// @description 
value = 1;

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
state = collectableStates.Init;
bounceAmnt = irandom_range(1,4)
dir = array_create(4,0)
spd = array_create(4,0)
time = array_create(4,0)
type = collectableTypes.coin;
xDir = choose(1,-1);
tog = true;
_sin = 0;
_dir = 0;//actual direction

_spd = 0;//actual speed

_time = 0;

dir[collectableStates.Init] = irandom_range(pi/4,(3*pi)/4);//inital direction after initializing
dirOver90 = dir[collectableStates.Init]>pi/2;
dir[collectableStates.Fall] = (3*pi)/2;//direction after falling

dir[collectableStates.Coll] = pi/2;//direction after coll with ground

dir[collectableStates.Grab] = 0//degtorad(point_direction(x,y,obj_coinCounter.x,obj_coinCounter.y))//direction when picked up

var m =7;//general speed modifier
spd[collectableStates.Init] = 4*m; //these are the speed of their above counterparts

spd[collectableStates.Fall] = 4*m;

spd[collectableStates.Coll] = 2*m;

spd[collectableStates.Grab] = 8*m;



//time fall irrelevant, will stop when hits ground

time[collectableStates.Coll] = irandom_range(.3,.8*room_speed)/m;

//irrelevant, happens when reaches the coin counter on screen

_dir = dir[collectableStates.Init];

_spd = spd[collectableStates.Init];

_time = time[collectableStates.Init];
