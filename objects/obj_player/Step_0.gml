// handle movement key presses
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

var h_move = key_right - key_left;
var v_move = key_down - key_up;

nmove_v = add_v2(scale_v2(unit_v2(new Vector2(h_move, v_move)), sp), mod_v);

// handle non movement key presses
key_grapple = keyboard_check_pressed(ord("X"));
key_grapple_released = keyboard_check_released(ord("X"));


if (key_grapple) {
	grapple = instance_create_layer(x, y, layer, obj_grapple, 
	{
		origin: id,
		follow_target: cursor,
	});
}

if (key_grapple_released) {
	player_state = PlayerState.Move;
	if (grapple != noone) {
		grapple.retracting = true;
		grapple = noone;
	}
}

key_projectile = mouse_check_button_pressed(mb_right);

if (key_projectile) {
	instance_create_layer(x, y, layer, obj_projectile,
	{
		move_v: unit_v2(new Vector2(cursor.x - x, cursor.y - y))
	});
}