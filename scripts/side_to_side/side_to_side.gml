///side_to_side()

if (hspd != maxHspd*facing) 
	hspd = Approach(hspd, maxHspd*facing, accel);
	
hCol	= instance_place(x+hspd,y,obj_solid);
if (hCol) {
	if (jumpAtWalls) { 
		var success = jump_trajectory(y + jumpHeight*16, x + hspd, maxHspd, jumpHeight*16);
		if (!success) facing	= -1*facing;
	} else {
		facing	= -1*facing;
	}	
}
floorEmpty	= (!instance_place(x+hspd,y+6,obj_solid))
if (floorEmpty and stayOnPlatform) facing	= facing *-1;

image_xscale = facing;
vx	= hspd;
vy	= vspd;
