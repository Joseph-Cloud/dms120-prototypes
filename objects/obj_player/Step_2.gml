event_inherited();

if (equals_v2(cur_v, new Vector2(0, 0)) && player_state == PlayerState.Move)
	player_state = PlayerState.Idle;
if (!equals_v2(cur_v, new Vector2(0, 0)) && player_state == PlayerState.Idle)
	player_state = PlayerState.Move;
if (grapple != noone && grapple.target != noone) 
	player_state = PlayerState.Grapple;
	
handle_sprite_by_state();

x = clamp(x, sprite_half_size, room_width - sprite_half_size);
y = clamp(y, sprite_half_size, room_height - sprite_half_size);