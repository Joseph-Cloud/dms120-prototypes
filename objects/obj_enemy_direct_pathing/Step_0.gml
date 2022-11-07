if (target == noone) {
	target = instance_find(obj_player, all);
} else {
	//nmove_v = scale_v2(unit_v2(new Vector2(target.x - x, target.y - y)), sp);
	
	mp_potential_path_object(path, target.x, target.y, 5, 2, hobj_grappleable);
	var path_point = path_get_number(path) - 1;
	nmove_v = scale_v2(unit_v2(new Vector2(path_get_point_x(path, path_point) - x, path_get_point_y(path, path_point) - y)), sp);
	while(place_meeting(x + nmove_v.x, y + nmove_v.y, hobj_grappleable)) {
		show_debug_message("TRYING PATH");
		show_debug_message(path_point);
		nmove_v = scale_v2(unit_v2(new Vector2(path_get_point_x(path, path_point) - x, path_get_point_y(path, path_point) - y)), sp);
		show_debug_message(json_stringify(nmove_v));
		path_point--;
	}
}