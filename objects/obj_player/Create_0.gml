enum PlayerState {
	Idle,
	Move,
	Attack,
	Grapple,
}

player_state = PlayerState.Idle;

function normalize_move_by_state(move_v) {
	switch player_state {
		case PlayerState.Idle:
		case PlayerState.Move:
			return normal_cap_v2(move_v, sp);
			break;
		case PlayerState.Grapple:
		case PlayerState.Attack:
			return normal_cap_v2(move_v, special_speed_cap);
			break;
	}
}

// Create player cursor
cursor = instance_create_layer(x, y, "cursor", obj_cursor,
{
	follow_target : instance_create_layer(x, y, "cursor", obj_mouse)
});
// Instantiate empty grapple
grapple = noone;

function handle_sprite_by_state() {
	switch player_state {
		case PlayerState.Idle:
			sprite_index = spr_player_idle;
			break;
		case PlayerState.Move:
			sprite_index = spr_player_moving;
			break;
		case PlayerState.Attack:
			//sprite_index = spr_player_attack
			break;
		case PlayerState.Grapple:
			sprite_index = spr_player_grappling;
			break;
	}
}

// Inherit the parent event
event_inherited();

id.sp = 10; // speed modifier
special_speed_cap = 25;