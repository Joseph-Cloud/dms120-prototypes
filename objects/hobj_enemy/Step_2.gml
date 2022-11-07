event_inherited();

if (!handle_collision_x(obj_player) && !handle_collision_x(obj_lever) && !handle_collision_x(hobj_enemy)) {
	x += cur_v.x;
}

if (!handle_collision_y(obj_player) && !handle_collision_y(obj_lever) && !handle_collision_y(hobj_enemy)) {
	y += cur_v.y;
}

if (equals_v2(cur_v, new Vector2(0, 0)) && enemy_state == EnemyState.Move)
	enemy_state = EnemyState.Idle;
if (!equals_v2(cur_v, new Vector2(0, 0)) && enemy_state == EnemyState.Idle)
	enemy_state = EnemyState.Move;

x = clamp(x, sprite_half_size, room_width - sprite_half_size);
y = clamp(y, sprite_half_size, room_height - sprite_half_size);