/// @description 
x = obj_player.x;
y = obj_player.y;


var onGround = OnGround();

if (onGround) {
	alarm[0] = 5;	
	obj_player.onGround = true;
}