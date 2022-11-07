if (target == noone) {
	instance_destroy(id);
} else {
	var a	= sqr(target.x - x) + sqr(target.y - y);
	var b	= 2 * (target.x - x) * (x - target.x) + 2 * (target.y - y) * (y - target.y);
	var c	= sqr(x - target.x) + sqr(y - target.y) - sqr(ranged_pathing_radius);
	var	t = (b * -1 - sqrt(sqr(b) - 4 * a * c)) / (2 * a);
	
	var intersect_x = (target.x - x) * t + x;
	var intersect_y = (target.y - y) * t + y;
	var in_radius	= point_distance(x, y, target.x, target.y) < ranged_pathing_radius;
	
	if (point_distance(x, y, intersect_x, intersect_y) > ranged_pathing_radius/4) {
		if (in_radius) {
			nmove_v = scale_v2(unit_v2(new Vector2(x - target.x, y - target.y)), sp);
		} else {
			nmove_v = scale_v2(unit_v2(new Vector2(target.x - x, target.y - y)), sp);
		}
	} else if (zero_v2(move_v)){
		nmove_v = scale_v2(unit_v2(new Vector2(target.x - x, target.y - y)), sp);
	} else {
		nmove_v = move_v;	
	}
} 

if (attack_interval_counter == 0) {
	instance_create_layer(x, y, layer, obj_projectile, {
		move_v: unit_v2(new Vector2(target.x - x, target.y - y))
	});
	attack_interval_counter = ranged_attack_interval;
} else {
	attack_interval_counter -= 1;	
}