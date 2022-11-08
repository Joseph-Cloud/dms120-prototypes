enum PlayerState {
	Idle,
	Move,
	Attack,
	Grapple,
}

player_state = PlayerState.Idle;

// Create player cursor
cursor = instance_create_layer(x, y, "cursor", obj_cursor,
{
	follow_target : instance_create_layer(x, y, "cursor", obj_mouse)
});
// Instantiate empty grapple
grapple			= noone;
grapple_weight	= GrappleWeight.Neutral;

// Instantiate empty sword
sword = noone;

function handle_sprite_by_state() {
	switch player_state {
		case PlayerState.Idle:
			sprite_index = spr_player_idle;
			break;
		case PlayerState.Move:
			sprite_index = spr_player_moving;
			break;
		case PlayerState.Attack:
			sprite_index = spr_player_attacking;
			break;
		case PlayerState.Grapple:
			sprite_index = spr_player_grappling;
			break;
	}
}

// Inherit the parent event
event_inherited();

function normalize_move_by_state() {
	switch player_state {
		case PlayerState.Idle:
		case PlayerState.Move:
			cur_v = normal_cap_v2(cur_v, sp);
			break;
		case PlayerState.Grapple:
		case PlayerState.Attack:
			cur_v = normal_cap_v2(cur_v, special_speed_cap);
			break;
	}
}

hp		= 6;
id.sp	= 10; // speed modifier