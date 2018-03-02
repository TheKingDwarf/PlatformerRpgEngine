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
type = collectableTypes.coin;

lifetime = 15*room_speed;
xx = 0;//holds the amount to add to x for collisions 
yy = 0;

yspeedUp = 3;//speed per step going up
yspeedDown = 4;//speed per step falling
yspeedDecay = 2;//speed lost when hitting a wall

xspeed = 2;
xspeedDecay = 2;

timeup = 12;//time that you go up, in frames

alarm[1] = 15*lifetime;

