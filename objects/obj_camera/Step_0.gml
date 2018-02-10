/// @description 
var speedDiv = 8;
x += (xTo - x  + (48*follow.image_xscale))/speedDiv;
y += (yTo - y)/speedDiv;


if (follow != noone) 
{
	xTo = follow.x;
	yTo = follow.y;
	
}

	
//Screenshake
if(screenshake > 0) {
	screenshake -= 0.5;
	screenshake = clamp(screenshake, 0, 10);
	x += irandom_range(-screenshake, screenshake);
	y += irandom_range(-screenshake, screenshake);
				
	gamepad_set_vibration(0,screenshake/2,screenshake/2);
} else {
	gamepad_set_vibration(0,0,0);
}

x = round(x);
y= round(x);
	

			



