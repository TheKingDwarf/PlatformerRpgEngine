/// @description 
// Vertical

vx += knockback;
vy -= knockup;


repeat(abs(vy)) {
    if (!place_meeting(x, y + sign(vy), obj_solid))
        y += sign(vy); 
    else {
        vy = 0;
        break;
    }
}
vy -= knockup;

// Horizontal
repeat(abs(vx)) {
    if (!place_meeting(x + sign(vx), y, obj_solid))
        x += sign(vx); 
    else {
        vx = 0;
        break;
    }
}
vx -= knockback;

if (knockback > 0)
knockback--;
if (knockup > 0)
knockup--;