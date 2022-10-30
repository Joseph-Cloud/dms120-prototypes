// Allows for cross object move vector changes
function add_to_mod_v(nmod_v, obj_id) {
	if (!variable_instance_exists(obj_id, "mod_v"))	return
	obj_id.mod_v = add_v2(obj_id.mod_v, nmod_v)
}

function calc_new_move_vector(nmove_v, move_v, prev_v, cur_v, mod_v, interp_mod, time, time_scale) {
	nmove_v = add_v2(nmove_v, mod_v)
	if !equals_v2(nmove_v, move_v) {
		move_v = nmove_v
		prev_v = cur_v
		var scale_increase = magnitude_v2(subtract_v2(move_v, prev_v)) * interp_mod
		if time_scale - time < scale_increase
			time_scale += scale_increase - (time_scale - time)
	}
	if time == time_scale {
		time = 0
		time_scale = 0
	}
	return interpolate_rot_v2(prev_v, move_v, time, time_scale)
}