/// @description 

// Inherit the parent event
event_inherited();
var collolol = instance_place(x,y,obj_collectable);
if (collolol) {
	switch (collolol.type) {
		case collectableTypes.coin:
			coins += collolol.value;
			break;
		case collectableTypes.heal:
			hp += collolol.value;
			break;
		case collectableTypes.spel:
			//unlock next spell
			break;
	}	
}

