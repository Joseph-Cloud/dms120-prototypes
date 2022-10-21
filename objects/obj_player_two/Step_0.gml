// basic movement
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

var h_move = key_right - key_left;
var v_move = key_down - key_up;

x += h_move * sp
y += v_move * sp