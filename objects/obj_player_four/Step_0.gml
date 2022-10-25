// handle non movement key presses
key_grapple = keyboard_check_pressed(ord("X"))


if key_grapple {
	handle_grapple_key_press()
}

if player_state == PlayerState.Grapple {
	interp_mod = max(interp_mod, grapple_interp_mod)
	mod_v = add_v2(mod_v, calc_grapple_vector_mod())
	check_grapple_conditions()
}