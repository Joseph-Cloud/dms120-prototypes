if (target != noone) {
	x = target.x;
	y = target.y;
	return;
}

calc_new_move_vector();
normalize_move_by_state();

x += cur_v.x;
y += cur_v.y;