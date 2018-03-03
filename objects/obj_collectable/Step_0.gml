/// @description move using physics
if (bounce_times < 5) {
	xx += xspeed;
	yy += yspeedUp;
	var acc = .2;//colision accuracy
	
	//if (abs(yy) < acc){
		//yspeedUp=0;
		//xspeed = 0;
		//yy = 0;
		//xx = 0;
	//}
	
	for (var i = 0; i < abs(yy); i += acc) {
		if (!place_meeting(x,y+acc*sign(yy),obj_solid)){
			y += acc*sign(yy);
		} else {
			yspeedUp = -yspeedUp;
			bounce_times++;
			if (abs(yspeedUp)*-1=yspeedUp) {
				if (alarm[0] <= 0) alarm[0] = 10;	
			}
			
		}
	}
	
	for (var i = 0; i < abs(xx); i += acc) {
		if (!place_meeting(x+acc*sign(xx),y,obj_solid)){
			x += acc*sign(xx);
		} else {
			xspeed = xspeed/-xspeedDecay;	
		}
	}
}


