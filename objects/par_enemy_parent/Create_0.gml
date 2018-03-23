/// @description 
event_inherited();
enum EnemyStates { //status effects
	normal,
	frozen,
	burning,
	stunned,
	recovering,
	flying	
}

enum EnemyTypes {
	Melee,
	Flying,
	Miniboss,
	Misc
	
}

state = EnemyStates.normal;
shader = 0;

//these control the path algorithms
inAttack = false;//make paths to player
inWander = false;//wander around to random points
inPatrol =true;//patrol on given path
image_xscale = -1;
//enemy dna

hp = 5;
damage = 1;
intell = 5;// between 0-10, determines how well the enemy avoids obstacles/whether or not they track the player
type = EnemyTypes.Melee;
canJump = true;
needsSight = true;//needs to see the player to agro, ie no walls etc
agroRange = 288;
visionCone = 60; //vision arc, starting from zero
loot[0] = 1;// loot[0] is for coins
loot[1] = 1;// loot[1] is for xp
loot[2] = 0;// loot[2] is for health drops

//patrols
//list of patrol point objects
targetX = 0;
targetY = 0;

currentPath = 0;


// Movement ///////////////////////////////////////////////////////////////////

// Multiplier
m = 1.6;
//still needs tweaking
groundAccel = .7  * m;
groundFric  = 1.9  * m;
airAccel    = 0.55 * m;
airFric     = 1.9 * m;
vxMax       = 8.0  * m;
vyMax       = 14.0 * m;
jumpHeight  = 12.0  * m;
gravNorm    = 0.9  * m;
gravSlide   = 0.25 * m; 

clingTime   = 4.0 * m;
canJump = 0;

// Misc ///////////////////////////////////////////////////////////////////////

// Relative collision checks
cLeft  = place_meeting(x - 1, y, obj_solid);
cRight = place_meeting(x + 1, y, obj_solid);

// Common calculation
sqrt2 = sqrt(2);