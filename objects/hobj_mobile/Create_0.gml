nmove_v = new Vector2(0, 0)
move_v	= new Vector2(0, 0)
prev_v	= new Vector2(0, 0)
cur_v	= new Vector2(0, 0)
mod_v	= new Vector2(0, 0)

interp_mod			= 0.1
interp_degrade_rate = 0.05
interp_const		= 0.1 // 'slippery' factor

/*	
Standard rotation duration (rotation with a change in magnitude of 1) occurs
	over 10 frames (step_val of 0.1)
Rotation duration increases both as the step_val increases and with greater
	magnitude differences
Change magnitude is calculated by as strict vector difference, not by arclength
	of the rotation (makes opposite directional changes feel better) 
*/

step_val	= 0.1 // time value of a frame
time_scale	= 0 // rotation duration
time		= 0 // time value of the current frame
sp			= 5 // speed modifier

function calc_new_move_vector() {
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
	time = min(time + step_val, time_scale)
	return interpolate_rot_v2(prev_v, move_v, time, time_scale)
}

function halt() {
	nmove_v = new Vector2(0, 0)
	move_v	= new Vector2(0, 0)
	prev_v	= new Vector2(0, 0)
	cur_v	= new Vector2(0, 0)
	mod_v	= new Vector2(0, 0)
}

event_inherited()