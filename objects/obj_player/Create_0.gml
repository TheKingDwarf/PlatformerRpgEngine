//init
#region initializing sprite array and enums
enum playerStates {
	idle,
	run,
	falling,
	casting,
	frozen,
	talking
}

enum spells {
	destruction = 000001,
	nature = 000010,
	void = 000100,
	fireball = 	001001, // spells will follow this format. it is split up into 2 3 block chunks. a 1 in the first p
	lightning = 010001,//of the chunk = b, a 1 in the second part = y, a 1 in the third part = x;
	freeze = 100001,
	pushSpirit = 001010,
	vines = 010010,
	swarm = 100010,
	bendSpace = 001100,
	necromancy = 010100,
	pull = 100100	
}

enum armor {
	defaultArmor = 1, // starter
	enchantArmor = 1.5,//purchase at shops
	vikingArmor = 2, // get after defeating a viking lord
	holyArmor = 3, // if you are a "good" guy in the game, get this from the church of vikings
	
	ElfKingsCloak = 7 // easter egg, breaks game;
	
}

//sprite_array
sprite[playerStates.idle,0] = spr_player_run;//spr_player_idle
sprite[playerStates.idle,1] = spr_arms_idle;
sprite[playerStates.run,0] = spr_player_run;
sprite[playerStates.run,1] = spr_arms_run;
sprite[playerStates.falling,0] = spr_player_falling;
sprite[playerStates.falling,1] = spr_arms_falling;
sprite[playerStates.casting,0] = spr_player_casting;

//magic sprites
sprite[playerStates.casting,spells.destruction] = spr_arms_destruction;
sprite[playerStates.casting,spells.nature] = spr_arms_nature;
sprite[playerStates.casting,spells.void] = spr_arms_void;
sprite[playerStates.casting,spells.freeze] = spr_arms_freeze;
sprite[playerStates.casting,spells.pushSpirit] = spr_arms_pushSpirit;
sprite[playerStates.casting,spells.vines] = spr_arms_vines;
sprite[playerStates.casting,spells.swarm] = spr_arms_swarm;
sprite[playerStates.casting,spells.pull] = spr_arms_pull;
sprite[playerStates.casting,spells.necromancy] = spr_arms_necromancy;
sprite[playerStates.casting,spells.bendSpace] = spr_arms_bendSpace;
sprite[playerStates.casting,spells.fireball] = spr_arms_fireball;
sprite[playerStates.casting,spells.lightning] = spr_arms_lighting;
#endregion
//movement values
accel = 0.2;
decel = .5;
grav = 0.2;

jumpAccel = 3;

jumpForgive = 5;//how many steps off being off platform to "forgive" and still let player jump

hspd = 3;
vspd = 8;

facing = image_xscale;

//spells and states

level = 1;//level
xp = 0; //experience

hp = 10;//health
maxHp = 10;

armor = 1;//armor

coins = 0;//money

manaFull = 100; // maximum mana
mana = 100; // current mana
manaRegen = 5; //mana regen (out of combat)
manaRegenCombat = 1;//mana regen (in combat);

combatTimerMax = 30;//maximum time on the timer
combatTimer = 0;//current time

state = playerStates.idle;

keys[10] = 0; //keys for dungeons





