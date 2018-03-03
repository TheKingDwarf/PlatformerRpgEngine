//init
#region initializing sprite array and enums
enum playerStates {
	run,
	casting,
	frozen,
	talking
}

enum spells {
	destruction = 000001,
	nature = 000010,
	void = 000100,
	fireball = 	20, // spells will follow this format. it is split up into 2 3 block chunks. a 1 in the first p
	lightning = 10,//of the chunk = b, a 1 in the second part = y, a 1 in the third part = x;
	freeze = 30,
	pushSpirit = 001010,//cancel what was said above, the number is no "cost" of spell
	vines = 010010,
	swarm = 100010,
	bendSpace = 001100,
	necromancy = 010100,
	pull = 100100	
}

enum armorSets {
	defaultArmor = 1, // starter
	enchantArmor = 1.5,//purchase at shops
	vikingArmor = 2, // get after defeating a viking lord
	holyArmor = 3, // if you are a "good" guy in the game, get this from the church of vikings
	
	ElfKingsCloak = 7 // easter egg, breaks game;
	
}

//sprite_array
//sprite[playerStates.idle,0] = spr_player_run;//spr_player_idle
//sprite[playerStates.idle,1] = //spr_arms_idle;
//sprite[playerStates.run,0] = spr_player_run;
//sprite[playerStates.run,1] = //spr_arms_run;
//sprite[playerStates.falling,0] = //spr_player_falling;
//sprite[playerStates.falling,1] = //spr_arms_falling;
//sprite[playerStates.casting,0] = spr_player_casting;

////magic sprites
//sprite[playerStates.casting,spells.destruction] = spr_arms_destruction;
//sprite[playerStates.casting,spells.nature] = spr_arms_nature;
//sprite[playerStates.casting,spells.void] = spr_arms_void;
//sprite[playerStates.casting,spells.freeze] = spr_arms_freeze;
//sprite[playerStates.casting,spells.pushSpirit] = spr_arms_pushSpirit;
//sprite[playerStates.casting,spells.vines] = spr_arms_vines;
//sprite[playerStates.casting,spells.swarm] = spr_arms_swarm;
//sprite[playerStates.casting,spells.pull] = spr_arms_pull;
//sprite[playerStates.casting,spells.necromancy] = spr_arms_necromancy;
//sprite[playerStates.casting,spells.bendSpace] = spr_arms_bendSpace;
//sprite[playerStates.casting,spells.fireball] = spr_arms_fireball;
//sprite[playerStates.casting,spells.lightning] = spr_arms_lighting;
#endregion
//movement values
// Inherit oParEntity variables
event_inherited();

//load audio
audio_group_load(audio_player_spells)
// Movement ///////////////////////////////////////////////////////////////////

// Multiplier
m = 1.6;
//still needs tweaking
groundAccel = 1.0  * m;
groundFric  = 1.9  * m;
airAccel    = 0.8 * m;
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

//spells and states

level = 1;//level
xp = 0; //experience

hp = 10;//health
maxHp = 10;


damage = 1; // damage modifier

armor = armorSets.defaultArmor;//armor

coins = 0;//money

manaFull = 100; // maximum mana
mana = 100; // current mana
manaRegen = 1; //mana regen (out of combat)
manaRegenCombat = 1/10;//mana regen (in combat);

combatTimerMax = 60;//maximum time on the timer
combatTimer = 0;//current time

state = playerStates.run;

keys[10] = 0; //keys for dungeons

canCast = true;// can cast a spell
spell = 000000;

knockback = 0;





