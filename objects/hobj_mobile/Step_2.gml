calc_new_move_vector();
normalize_move_by_state();

if (place_meeting(x + cur_v.x, y, hobj_physics)) {
	while(!place_meeting(x + sign(cur_v.x), y, hobj_physics)) {
		x = x + sign(cur_v.x);	
	}
} else {
	x += cur_v.x;
}

if (place_meeting(x, y + cur_v.y, hobj_physics)) {
	while(!place_meeting(x, y + sign(cur_v.y), hobj_physics)) {
		y = y + sign(cur_v.y);	
	}
} else {
	y += cur_v.y;
}
