key_left = keyboard_check(ord("A"))
key_right = keyboard_check(ord("D"))
key_up = keyboard_check(ord("W"))
key_down = keyboard_check(ord("S"))
key_grapple = keyboard_check_pressed(ord("X"))

var h_move = key_right - key_left
var v_move = key_down - key_up
var mod_v  = new Vector2(0, 0)

// Each frame, degrade the interp mod towards the interp_const
interp_mod = max(interp_mod - interp_degrade_rate, interp_const)

if key_grapple {
	handle_grapple_key_press()
}

if player_state == PlayerState.Grapple {
	draw_set_colour(c_black)
	draw_line(x, y, grapple_target.x, grapple_target.y)
	interp_mod = max(interp_mod, grapple_interp_mod)
	mod_v = add_v2(mod_v, calc_grapple_vector_mod())
	check_grapple_conditions()
}

//new_mv = scale_v2(unit_v2(new Vector2(h_move, v_move)), sp)
//cur_v = calc_current_vector_dynamic(new_mv, mod_v, interp_mod)
new_mv = add_v2(scale_v2(unit_v2(new Vector2(h_move, v_move)), sp), mod_v)
show_debug_message(json_stringify(new_mv))
cur_v = calc_current_vector(new_mv, interp_mod)
cur_v = normalize_move_by_state(cur_v)

x += cur_v.x
y += cur_v.y