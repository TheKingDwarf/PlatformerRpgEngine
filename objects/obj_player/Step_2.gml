/// @description 

// Inherit the parent event
event_inherited();
var collolol = instance_place(x,y,obj_collectable);
if (collolol) {
	if (collolol.type = 0) {
		coins += collolol.value;
		
	} else {
		if (collolol.type = 1) {
			hp += collolol.value;	
		} else {
			//next spell = unlocked
		}
	} 
	instance_destroy(collolol)

}

