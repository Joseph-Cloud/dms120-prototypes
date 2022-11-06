enum EnemyState {
	Idle,
	Move,
	Attack,
}

enemy_state = EnemyState.Idle;

function normalize_move_by_state() {
	switch enemy_state {
		case EnemyState.Idle:
		case EnemyState.Move:
			cur_v = normal_cap_v2(cur_v, sp);
			break;
		case EnemyState.Attack:
			cur_v = normal_cap_v2(cur_v, special_speed_cap);
			break;
	}
}

event_inherited();

