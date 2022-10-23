// vector based movement with linear interpolation
function calc_current_vector_three(new_mv) {
	if (!equals_v2(new_mv, move_v)) {
		move_v = new_mv
		time = 0
		prev_v = cur_v
		time_scale = magnitude_v2(subtract_v2(move_v, prev_v))
	}
	new_cv = add_v2(scale_v2(move_v, time/time_scale), scale_v2(prev_v, 1 - time/time_scale))
	if (time + step_val < time_scale) 
		time += step_val
	else 
		time = time_scale
	return new_cv
}

move_v = new Vector2(0, 0)
prev_v = new Vector2(0, 0)
cur_v = new Vector2(0, 0)
interp_mod = 1
step_val = 0.1
time_scale = 1
time = 0