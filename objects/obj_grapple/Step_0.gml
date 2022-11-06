if ((x > room_width || x < 0 || y > room_height || y < 0)
	|| (compare_direction_v2(move_v, new Vector2(origin.x - x, origin.y - y))
	&& point_distance(x, y, origin.x, origin.y) > distance_const)) {
	retracting = true;
}

if (follow_target != noone) {
	show_debug_message(point_distance(x, y, origin.x, origin.y));
}

if (retracting) {
	target = noone;
	if (point_distance(x, y, origin.x, origin.y) < distance_const) {
		if (variable_instance_exists(origin, "grapple")) origin.grapple = noone;
		instance_destroy(id);
	}
	nmove_v = scale_v2(unit_v2(new Vector2(origin.x - x, origin.y - y)), sp);
	return;
}

if (target != noone) {
	if (point_distance(x, y, origin.x, origin.y) < distance_const) {
		if (variable_instance_exists(origin, "grapple")) origin.grapple = noone;
		instance_destroy(id);
	}
	halt();
	var grapple_direction = new Vector2(target.x - origin.x, target.y - origin.y);
	var grapple_distance = min(magnitude_v2(grapple_direction), grapple_distance_scale);
	var grapple_vector = scale_v2(grapple_direction, (grapple_distance/grapple_distance_scale) * grapple_sp_mod);
	if (origin.grapple_weight > target.grapple_weight) {
		add_to_mod_v(negative_v2(grapple_vector), target);
	} else if (origin.grapple_weight < target.grapple_weight) {
		add_to_mod_v(grapple_vector, origin);
	} else {
		add_to_mod_v(grapple_vector, origin);
		add_to_mod_v(negative_v2(grapple_vector), target);
	}
	return;
}

nmove_v = scale_v2(unit_v2(new Vector2(follow_target.x - x, follow_target.y - y)), sp);

var collided_obj = noone;
var collision_list = ds_list_create();
collision_point_list(x, y, hobj_physics, false, true, collision_list, false);
for (i = 0; i < ds_list_size(collision_list); i++) {
	var obj = collision_list[| i];
	if (obj != id && obj != origin && obj.object_index != obj_grapple) {
		collided_obj = collision_list[| i];
		break;
	}
}

delete(collision_list);

if (collided_obj != noone) {
	target = collided_obj;
	
	if (target.grapple_weight == GrappleWeight.Interactive) {
		halt();
		target.interact();
		target = noone;
		retracting = true;
		return;
	}
	
	grapple_distance_scale = point_distance(origin.x, origin.y, target.x, target.y);
}
