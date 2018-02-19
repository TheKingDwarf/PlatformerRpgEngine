///lightning_split(id)
/// @param id
if(argument0 == noone)
    return false;

//Values closer to zero does not go as far out from the center, while higher values do
var minRotation = -40, maxRotation = 40;
var splitSize = 6;
with(argument0)
{
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