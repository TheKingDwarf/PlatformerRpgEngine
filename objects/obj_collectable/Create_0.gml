/// @description 
value = 1;


state = collectableStates.Init;
type = collectableTypes.coin;
bounce_times = 0;
lifetime = 15*room_speed;
xx = 0;//holds the amount to add to x for collisions 
yy = 0;
y-= 4;

var m = .2;//overall speed changer
yspeedUp = -3*m;//speed per step 
yspeedDecay = 2;//speed lost when hitting a wall
var randomXdirection = choose(-1,1);
xspeed = m*random_range(0.01,1)*randomXdirection;
xspeedDecay = 2;

alarm[0] = 10;

timeup = 12;//time that you go up, in frames

alarm[1] = lifetime;

