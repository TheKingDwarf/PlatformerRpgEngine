/// @description 
//alpha control
if (ds_list_empty(splits)) { // if the splits arent generated, make them
//lightning_split(id);
var minRotation = -40, maxRotation = 40;
var splitSize = 8;

    var dist = point_distance(x, y, targetX, targetY);
    var dir = point_direction(x, y, targetX, targetY);
    var currentX = x, currentY = y;
    for(var i = 0; i < dist div splitSize; i ++)
    {
        var newDir = dir + irandom_range(minRotation, maxRotation);
        currentX += lengthdir_x(splitSize, newDir);
        currentY += lengthdir_y(splitSize, newDir);
        ds_list_add(splits, currentX);
        ds_list_add(splits, currentY);
	}	
	
}
//decrease alpha
alpha -= .5 / fadeTime;
if(alpha <= .5)
    instance_destroy();
	
// create damage objects on collision
var coll = noone;
if (instance_exists(obj_aimer))
coll = collision_line(obj_player.x,obj_player.y,obj_aimer.x,obj_aimer.y,par_enemy_debug,false,true);

if (coll) {
	var dam = instance_create_layer(coll.x,coll.y,layer,par_damage);	
	dam.parent = obj_player.id;
}