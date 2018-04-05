/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hspd	= 0;
jumpHeight = 2;//blocks
accel	= 0.2;
grav	= 0.3;
maxHspd = 3;
maxVspd = 8;

stayOnPlatform	= true; //whether or not the enemy walks off sides of platforms
jumpAtWalls		= true;

state	= side_to_side();

facing	= 1;


