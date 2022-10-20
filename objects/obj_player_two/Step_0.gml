key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)
key_up = keyboard_check(vk_up)
key_down = keyboard_check(vk_down)

var h_move = key_right - key_left;
var v_move = key_down - key_up;

x += h_move * sp
y += v_move * sp