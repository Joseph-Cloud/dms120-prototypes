/*if (target != noone) {
	var distance = point_distance(origin.x, origin.y, target.x, target.y)
	var angle = point_direction(origin.x, origin.y, target.x, target.y)
	draw_sprite_ext(spr_grapple, image_index, origin.x, origin.y, distance/sprite_get_width(spr_grapple), 1, angle, c_white, 1)
	return
} else {*/
	/*var distance = point_distance(x, y, end_x, end_y)
	var angle = point_direction(x, y, end_x, end_y)*/
var distance = point_distance(origin.x, origin.y, x, y);
var angle = point_direction(origin.x, origin.y, x, y);
draw_sprite_ext(spr_grapple, image_index, origin.x, origin.y, distance/sprite_get_width(spr_grapple), 1, angle, c_white, 1);
//	return
//}
