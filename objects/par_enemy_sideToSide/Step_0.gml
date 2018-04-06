/// @description Insert description here
// You can write your code in this editor
script_execute(state);

if (attack_timer <= 0) script_execute(attack_type);
attack_timer--;

if (hp <= 0) instance_destroy();