

var range = 64;

if (abs(obj_player.x-x) < range and abs(obj_player.y-y) < range and obj_player.y>y) {
	var dir = sign(obj_player.x-x);
	vx = (maxHspd * 2 * dir);
	vy = (-vyMax);
	attack_timer = 45;
}