/// @description 
// Vertical

vx += knockback;
vy -= knockup;

if (knockback > 0)
knockback--;
if (knockup > 0)
knockup--;
repeat(abs(vy)) {
    if (!place_meeting(x, y + sign(vy), obj_solid))
        y += sign(vy); 
    else {
        vy = 0;
        break;
    }
}

// Horizontal
repeat(abs(vx)) {
    if (!place_meeting(x + sign(vx), y, obj_solid))
        x += sign(vx); 
    else {
        vx = 0;
        break;
    }
}