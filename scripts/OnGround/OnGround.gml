/// OnGround();

return place_meeting(x, y + 1, obj_solid) || (place_meeting(x, y + 1, par_jump_through ) && !place_meeting(x, y, par_jump_through));