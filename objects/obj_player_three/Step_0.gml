key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

var h_move = key_right - key_left;
var v_move = key_down - key_up;

new_mv = new Vector2(h_move, v_move)
cur_v = calc_current_vector_three(new_mv)
if (magnitude_v2(cur_v) > 1) cur_v = unit_v2(cur_v)

var move = scale_v2(cur_v, sp)

x += move.x
y += move.y