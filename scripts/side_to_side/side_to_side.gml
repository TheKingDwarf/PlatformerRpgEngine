///side_to_side()
var onGround = OnGround();
if (hspd != maxHspd*facing) 
	hspd = Approach(hspd, maxHspd*facing, accel);
	
hCol	= instance_place(x+hspd,y,obj_solid);
if (hCol) {
	facing	= -facing;
	hspd = -hspd;
		
}
if (!onGround) vspd = Approach(vspd, maxVspd, grav)
floorEmpty	= (!instance_place(x+hspd,y+2,obj_solid))
if (floorEmpty and stayOnPlatform) {
	facing	= -facing;
	hspd = -hspd;
}
image_xscale = facing;
if (abs(vspd) > maxVspd) vspd = maxVspd * sign(vspd);
if (abs(hspd) > maxHspd) hspd = maxHspd * sign(hspd);
vx	= hspd;
vy	= vspd;
