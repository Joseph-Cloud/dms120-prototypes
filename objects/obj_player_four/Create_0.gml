// begin:	state handling
enum PlayerState {
	Idle,
	Move,
	Attack,
	Grapple,
}

player_state = PlayerState.Idle

// end:		state handling
// begin:	movement
// vector based movement with rotational interpolation
/*function calc_current_vector_dynamic(new_mv, mod_v, interp_mod) {
	if !equals_v2(new_mv, move_v) {
		move_v = new_mv
		time = 0
		prev_v = cur_v
		time_scale = magnitude_v2(subtract_v2(move_v, prev_v)) * interp_mod
	}
	var modded_mv = add_v2(move_v, mod_v)
	new_cv = interpolate_rot_v2(prev_v, modded_mv, time, time_scale)
	if time + step_val < time_scale
		time += step_val
	else 
		time = time_scale
	return new_cv
}*/
function normalize_move_by_state(move_v) {
	switch player_state {
		case PlayerState.Idle:
		case PlayerState.Move:
			return normal_cap_v2(move_v, sp)
			break;
		case PlayerState.Grapple:
		case PlayerState.Attack:
			return normal_cap_v2(move_v, special_speed_cap)
			break;
	}
}

function calc_current_vector(new_mv, interp_mod) {
	if !equals_v2(new_mv, move_v) {
		move_v = new_mv
		prev_v = cur_v
		var scale_increase = 1 /*magnitude_v2(subtract_v2(move_v, prev_v))*/// * interp_mod
		//time_scale = time + scale_increase
		if time_scale - time < scale_increase
			time_scale += scale_increase - (time_scale - time)
	}
	if time == time_scale {
		time = 0
		time_scale = 0
	}
	new_cv = interpolate_rot_v2(prev_v, move_v, time, time_scale)
	time = min(time + step_val, time_scale)
	return new_cv
}

cursor = instance_create_layer(x, y, "cursor", obj_cursor,
{
	follow_target : instance_create_layer(x, y, "cursor", obj_mouse)
})



move_v = new Vector2(0, 0)
prev_v = new Vector2(0, 0)
cur_v = new Vector2(0, 0)
mod_v = new Vector2(0, 0)
interp_mod = 0.1
interp_degrade_rate = 0.05
interp_const = 0.1 // 'slippery' factor

/*	
Standard rotation duration (rotation with a change in magnitude of 1) occurs
	over 10 frames (step_val of 0.1)
Rotation duration increases both as the step_val increases and with greater
	magnitude differences
Change magnitude is calculated by as strict vector difference, not by arclength
	of the rotation (makes opposite directional changes feel better) 
*/

step_val = 0.1 // time value of a frame
time_scale = 0 // rotation duration
time = 0 // time value of the current frame
sp = 10 // speed modifier
special_speed_cap = 15
// end:		movement
// begin:	grapple
// Grapple functionality here is WIP
function end_grapple() {
	player_state = PlayerState.Move
	grapple_distance_scale = 0
	grapple_target = noone
}
	
function calc_grapple_vector_mod() {
	grapple_vector = new Vector2(grapple_target.x - x, grapple_target.y - y)
	grapple_distance = min(magnitude_v2(grapple_vector), grapple_distance_scale)
	return scale_v2(grapple_vector, (grapple_distance/grapple_distance_scale) * grapple_sp_mod)
}

/*function calc_grapple_vector_mod() {
	grapple_vector = unit_v2(new Vector2(grapple_target.x - x, grapple_target.y - y))
	return scale_v2(grapple_vector, grapple_sp)
}*/

function check_grapple_conditions() {
	if (place_meeting(x, y, grapple_target))
		end_grapple()
}

function handle_grapple_key_press() {
	if player_state == PlayerState.Grapple {
		end_grapple()
		return
	}
	var grapple_target_list = ds_list_create()
	collision_point_list(obj_cursor.x, obj_cursor.y, obj_physics, false, true, grapple_target_list, false)
	show_debug_message(json_encode(grapple_target_list))
	for (var i = 0; ds_list_size(grapple_target_list); i++) {
		var target = ds_list_find_value(grapple_target_list, i)
		if (target.grappleable) {
			grapple_target = target
			player_state = PlayerState.Grapple
			grapple_distance_scale = abs(sqrt(sqr(grapple_target.x - x) + sqr(grapple_target.y - y)))
			check_grapple_conditions()
			return
		}
	}
}

grapple = noone
grapple_target = noone
grapple_distance_scale = 0
#macro grapple_sp_mod 0.1
//#macro grapple_sp 15
#macro grapple_interp_mod 0.2
// end grapple
// begin:	sprite handling
function handle_sprite_by_state() {
	switch player_state {
		case PlayerState.Idle:
			sprite_index = spr_player_idle
			break;
		case PlayerState.Move:
			sprite_index = spr_player_moving
			break;
		case PlayerState.Attack:
			//sprite_index = spr_player_attack
			break;
		case PlayerState.Grapple:
			sprite_index = spr_player_grappling
			break;
	}
}
// end:		sprite handling