/// @description move using physics


if (state = 0) { // move up along arc
	
	if (_dir != dir[collectableStates.Fall]) {//if we dont equal our descend angle
		if (dirOver90) {
			_dir = Approach(_dir,dir[collectableStates.Fall],_spd);
		} else {
			_dir = Approach(_dir,dir[collectableStates.Fall],-_spd);;
			
		}
	}

	var yy = lengthdir_y(_spd,_dir);
	var xx = .5*xDir;//lengthdir_x(_spd,_dir);
	if (instance_place(x+xx,y+yy,obj_solid))xDir = -xDir;//change direction
	if (yy < 0) {
		state = collectableStates.Fall; //switch states
		_spd = spd[collectableStates.Fall];
		_time = time[collectableStates.Fall];
		_dir = dir[collectableStates.Fall]*pi;
		xDir=-xDir;
	}

	x -= xx;
	y -= yy;
	
}

if (state = 1) { // move down
	var yy = lengthdir_y(_spd,_dir);
	var xx = .5*xDir;
	_dir = dir[collectableStates.Fall]*pi;
	if (instance_place(x,y-yy,obj_solid)){ //if there is a bloche benough us
		y-=yy;//move down
		state = collectableStates.Coll; //switch states
		_dir = dir[collectableStates.Coll];
		_spd = spd[collectableStates.Coll];
		_time = time[collectableStates.Coll];
		
		exit;
		
		
	} else {	
		y -= yy; //else just move down
		x += xx;
	}
}

if (state =2) {//bounce up
	if (bounceAmnt > 0) {
	var _bounceHeight = _spd;
	if (tog) {
	_sin = Approach(_sin,1,.1);
	} else {
	_sin = Approach(_sin,-1,.1);
	}
	yy = _sin*_spd
	var xx = .5*xDir
	y -= yy;
	x += xx;
	show_debug_message(string(yy))
	show_debug_message(string(xx))
	if (instance_place(x,y-yy,obj_solid)) {
		bounceAmnt--;
		tog = !tog;
	}
	} else {
		var yy = 0;//deactivate	
	}
}

if (state = 3) {//move to coin counter on screen
	var _coinCounterx = obj_camera.x-camera_get_view_width(obj_camera.mainCamera)/2;	
	var _coinCountery = obj_camera.y-camera_get_view_height(obj_camera.mainCamera)/2;	
	var xx = Approach(x,_coinCounterx,_spd);
	var yy = Approach(y,_coinCountery,_spd);
	x += xx;
	y += yy;
}