// handle calculated player movement
key_left = keyboard_check(ord("A"))
key_right = keyboard_check(ord("D"))
key_up = keyboard_check(ord("W"))
key_down = keyboard_check(ord("S"))

var h_move = key_right - key_left
var v_move = key_down - key_up


//new_mv = scale_v2(unit_v2(new Vector2(h_move, v_move)), sp)
//cur_v = calc_current_vector_dynamic(new_mv, mod_v, interp_mod)
new_mv = add_v2(scale_v2(unit_v2(new Vector2(h_move, v_move)), sp), mod_v)
//new_mv = normalize_move_by_state(new_mv)
cur_v = calc_current_vector(new_mv, interp_mod)
cur_v = normalize_move_by_state(cur_v)
// Ensure new calculated move vector does not exceed global cap
cur_v = normal_cap_v2(cur_v, global_speed_cap)

x += cur_v.x
y += cur_v.y

if equals_v2(cur_v, new Vector2(0, 0)) && player_state == PlayerState.Move
	player_state = PlayerState.Idle
if !equals_v2(cur_v, new Vector2(0, 0)) && player_state == PlayerState.Idle
	player_state = PlayerState.Move
	
handle_sprite_by_state()