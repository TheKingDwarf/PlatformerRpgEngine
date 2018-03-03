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

//following are input controls
//if you want enemy to move left, make inLeft true, etc
inRight = false;
inLeft = false;
inAttack = false;
inIdle = true;
inJump = false;
inDamage = false;
inTrack = false;//track player
inPatrol =false;//patrol on given path
image_xscale = -1;
//enemy dna
var playerSpeed = 12.8;
var playerJump = 22.4;
hp = 5;
damage = 1;
spd = playerSpeed/2;//need to find out what half of the player speed is, this is what that should be
jmp = playerJump;
intell = 5;// between 0-10, determines how well the enemy avoids obstacles/whether or not they track the player
type = EnemyTypes.Melee;
canJump = true;
needsSight = true;//needs to see the player to agro, ie no walls etc
agroRange = 288;
visionCone = 60; //vision arc, starting from zero
loot[0] = 1;// loot[0] is for coins
loot[1] = 1;// loot[1] is for xp
loot[2] = 0;// loot[2] is for health drops
