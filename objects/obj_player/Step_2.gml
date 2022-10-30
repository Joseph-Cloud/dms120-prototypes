event_inherited();

if equals_v2(cur_v, new Vector2(0, 0)) && player_state == PlayerState.Move
	player_state = PlayerState.Idle
if !equals_v2(cur_v, new Vector2(0, 0)) && player_state == PlayerState.Idle
	player_state = PlayerState.Move
	
handle_sprite_by_state()