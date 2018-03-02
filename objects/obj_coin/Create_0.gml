/// @description 

// Inherit the parent event
event_inherited();

image_index += irandom(11);

var r = irandom(3);

switch (r) {
	case 0:
	sprite_index = spr_coin1
	break;	
	case 1:
	sprite_index = spr_gem1;
	break;	
	case 2:
	sprite_index = spr_gem2;
	break;	
	case 3:
	sprite_index = spr_gem3;
	break;
}

mask_index = sprite_index;
