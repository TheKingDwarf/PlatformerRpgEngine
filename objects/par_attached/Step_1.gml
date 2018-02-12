/// @description 
var dx;
var dy;
if (!parentInit) {
    if (parent) {
        dx = x - parent.x;
        dy = y - parent.y;
    } else {
        dx = 0;
        dy = 0;
    }
    parentInit = true;
}
if (parent) {
    x = parent.x + dx;
    y = parent.y + dy; 
}