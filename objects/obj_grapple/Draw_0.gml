if(follow_target != noone) {
	/*var distance = point_distance(x, y, end_x, end_y)
	var angle = point_direction(x, y, end_x, end_y)*/
	var distance = point_distance(x, y, follow_target.x, follow_target.y)
	var angle = point_direction(x, y, follow_target.x, follow_target.y)
	draw_sprite_ext(spr_grapple, image_index, x, y, distance/sprite_get_width(spr_grapple), 1, angle, c_white, 1)
}
if(target != noone) {
	var distance = point_distance(x, y, target.x, target.y)
	var angle = point_direction(x, y, target.x, target.y)
	draw_sprite_ext(spr_grapple, image_index, x, y, distance, 1, angle, c_white, 1)
}