/// @description 

// Inherit the parent event
event_inherited();

// draw
draw_dir = -1 // -1 for left, 1 for right
jumping = 1; // most characters spawn slightly off the ground

// movement
hspd = 0;
vspd = 0;

hpush = 0;
vpush = 0;

ctrl_move = 0;
ctrl_jump = 0;

particle_effect = 0;
particle_y = y;

dash = 0;

// attacking
attacking = false;
selected_weapon = 1; // usually only ever 1 for NPC

// hit
hit_crit = false;
hit_flash = false;
hit_damage = 0;
iframes = 0; // invincibility frames when hit

// control
ctrl_move = 0;
ctrl_attack = 0;
ctrl_jump = 0;

sprite_state = ESpriteState.IDLE;

sprite_array[ESpriteState.IDLE, ESpritePart.BODY] = sprite_index;
sprite_array[ESpriteState.IDLE, ESpritePart.WEAPON] = noone;
sprite_array[ESpriteState.IDLE, ESpritePart.ARMS] = noone;
sprite_array[ESpriteState.MOVE, ESpritePart.BODY] = sprite_index;
sprite_array[ESpriteState.MOVE, ESpritePart.WEAPON] = noone;
sprite_array[ESpriteState.MOVE, ESpritePart.ARMS] = noone;

sprite_array[ESpriteState.ATTACK, ESpritePart.BODY] = sprite_index;
sprite_array[ESpriteState.ATTACK, ESpritePart.WEAPON] = noone;
sprite_array[ESpriteState.ATTACK, ESpritePart.ARMS] = noone;



