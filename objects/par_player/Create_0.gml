/// @description Initialize

enum ESpriteState{
	IDLE,
	MOVE,
	ATTACK
}
enum ESpritePart{
	BODY = 0,
	WEAPON,
	ARMS
}
sprite_state = ESpriteState.IDLE

sprite_array[ESpriteState.IDLE, ESpritePart.BODY] = sprite_index
sprite_array[ESpriteState.IDLE, ESpritePart.WEAPON] = noone
sprite_array[ESpriteState.IDLE, ESpritePart.ARMS] = noone
sprite_array[ESpriteState.MOVE, ESpritePart.BODY] = sprite_index
sprite_array[ESpriteState.MOVE, ESpritePart.WEAPON] = noone
sprite_array[ESpriteState.MOVE, ESpritePart.ARMS] = noone

sprite_array[ESpriteState.ATTACK, ESpritePart.BODY] = sprite_index
sprite_array[ESpriteState.ATTACK, ESpritePart.WEAPON] = noone
sprite_array[ESpriteState.ATTACK, ESpritePart.ARMS] = noone

