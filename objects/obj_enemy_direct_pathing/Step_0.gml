if (target == noone) {
	target = instance_find(obj_player, all);
	show_debug_message(target);
} else {
	nmove_v = scale_v2(unit_v2(new Vector2(target.x - x, target.y - y)), sp);	
}