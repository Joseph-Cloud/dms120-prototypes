function calc_current_vector_four(new_mv) {
	if (!equals_v2(new_mv, move_v)) {
		move_v = new_mv
		time = 0
		prev_v = cur_v
		time_scale = magnitude_v2(subtract_v2(move_v, prev_v)) * interp_mod
	}
	new_cv = add_v2(scale_v2(prev_v, cos(time/time_scale * pi/2)), scale_v2(move_v, sin(time/time_scale * pi/2)))
	if (time + step_val < time_scale) 
		time += step_val
	else 
		time = time_scale
	return new_cv
}

move_v = new Vector2(0, 0)
prev_v = new Vector2(0, 0)
cur_v = new Vector2(0, 0)
interp_mod = 2 // 'slippery' factor

/*	
Standard rotation duration (rotation with a change in magnitude of 1) occurs
	over 10 frames (step_val of 0.1)
Rotation duration increases both as the step_val increases and with greater
	magnitude differences
Change magnitude is calculated by as strict vector difference, not by arclength
	of the rotation (makes opposite directional changes feel better) 
*/

step_val = 0.1 // time value of a frame
time_scale = 1 // rotation duration
time = 0 // time value of the current frame
sp = 10 // speed modifier