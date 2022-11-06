event_inherited();

function handle_sprite_by_state() {
	switch enemy_state {
		case EnemyState.Idle:
			sprite_index = spr_enemy;
			break;
		case EnemyState.Special:
		case EnemyState.Attack:
		case EnemyState.Move:
			sprite_index = spr_enemy_moving;
			break;
	}
}