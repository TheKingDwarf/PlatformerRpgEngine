/// @description 
event_inherited();
enum EnemyStates {
	idle,
	run,
	tracking,
	attacking,
	frozen,
	burning,
	stunned,
	recovering,
	flying	
}

state = EnemyStates.idle;
shader = 0;