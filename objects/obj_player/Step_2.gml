event_inherited();

if (equals_v2(cur_v, new Vector2(0, 0)) && player_state == PlayerState.Move)
	player_state = PlayerState.Idle;
if (!equals_v2(cur_v, new Vector2(0, 0)) && player_state == PlayerState.Idle)
	player_state = PlayerState.Move;
if (grapple != noone && grapple.target != noone) 
	player_state = PlayerState.Grapple;
	
handle_sprite_by_state();

if (!handle_collision_x(obj_player) && !handle_collision_x(obj_lever)) {
	x += cur_v.x;
}

if (!handle_collision_y(obj_player) && !handle_collision_y(obj_lever)) {
	y += cur_v.y;
}

x = clamp(x, sprite_half_size, room_width - sprite_half_size);
y = clamp(y, sprite_half_size, room_height - sprite_half_size);