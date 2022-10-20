key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_up = keyboard_check(vk_up);
key_down = keyboard_check(vk_down);

var h_move = key_right - key_left;
var v_move = key_down - key_up;

new_mv = new Vector2(h_move, v_move)
cur_v = calc_current_vector_three(new_mv)
if (magnitude_v2(cur_v) > 1) cur_v = unit_v2(cur_v)

x += cur_v.x * sp
y += cur_v.y * sp