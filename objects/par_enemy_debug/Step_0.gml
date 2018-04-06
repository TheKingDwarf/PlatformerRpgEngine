/// @description 
if (frame >0) {
frame--;
image_index++;
if (state = EnemyStates.frozen) {
shader = shd_make_blue;
}
} else {
shader = 0;	
}

