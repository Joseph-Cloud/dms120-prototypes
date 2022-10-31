if (retracting) {
	nmove_v = scale_v2(unit_v2(new Vector2(origin.x - x, origin.y - y)), sp)
}

var collided_obj = instance_position(x, y, hobj_physics)

if (collided_obj != noone) {
	target = collided_obj
	follow_target = noone
}

if (target == noone && follow_target == noone) {
		
}

if (target == noone) {
	nmove_v = scale_v2(unit_v2(new Vector2(follow_target.x - x, follow_target.y - y)), sp)
} else {
	
}