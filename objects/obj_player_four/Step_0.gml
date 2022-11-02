// handle non movement key presses
key_grapple = keyboard_check_pressed(ord("X"))
key_grapple_released = keyboard_check_released(ord("X"))


if (key_grapple) {
	grapple = instance_create_layer(x, y, layer, obj_grapple, 
	{
		origin: id,
		follow_target: cursor,
	})
}

if (key_grapple_released) {
	player_state = PlayerState.Move
	if (grapple != noone) {
		grapple.retracting = true
		grapple = noone
	}
}

if (player_state == PlayerState.Grapple) {
	interp_mod = max(interp_mod, grapple_interp_mod)
}