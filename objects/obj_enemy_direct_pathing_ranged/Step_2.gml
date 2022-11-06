event_inherited();

handle_sprite_by_state();

if (equals_v2(cur_v, new Vector2(0, 0)) && enemy_state == EnemyState.Move)
	enemy_state = EnemyState.Idle;
if (!equals_v2(cur_v, new Vector2(0, 0)) && enemy_state == EnemyState.Idle)
	enemy_state = EnemyState.Move;

x = clamp(x, sprite_half_size, room_width - sprite_half_size);
y = clamp(y, sprite_half_size, room_height - sprite_half_size);