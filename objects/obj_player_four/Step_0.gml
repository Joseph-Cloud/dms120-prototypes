key_left = keyboard_check(ord("A"))
key_right = keyboard_check(ord("D"))
key_up = keyboard_check(ord("W"))
key_down = keyboard_check(ord("S"))
key_grapple = keyboard_check_pressed(ord("X"))

var h_move = key_right - key_left
var v_move = key_down - key_up
var mod_v  = new Vector2(0, 0)

var interp_mod = interp_const

if key_grapple {
	handle_grapple_key_press()
}

if player_state == PlayerState.Grapple {
	mod_v = add_v2(mod_v, calc_grapple_vector_mod())
	check_grapple_conditions()
}

//new_mv = scale_v2(unit_v2(new Vector2(h_move, v_move)), sp)
//cur_v = calc_current_vector_dynamic(new_mv, mod_v, interp_mod)
new_mv = add_v2(scale_v2(unit_v2(new Vector2(h_move, v_move)), sp), mod_v)
show_debug_message(json_stringify(new_mv))
cur_v = calc_current_vector(new_mv, interp_mod)
if magnitude_v2(cur_v) > sp && 
   (player_state == PlayerState.Idle || player_state == PlayerState.Move)
	cur_v = normalize_v2(cur_v, sp)

x += cur_v.x
y += cur_v.y