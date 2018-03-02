/// @description 
event_inherited();

if (hp != lastHp) {
	for (var i = 0; i < 1; ++i) 
	instance_create_layer(x+irandom(sprite_width),y,global.FXlayer,obj_coin);
	lastHp = hp;
}

