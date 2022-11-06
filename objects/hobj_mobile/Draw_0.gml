draw_self();

var distance = point_distance(x, y, x + cur_v.x * 10, y + cur_v.y * 10);
var angle = point_direction(x, y, x + cur_v.x * 10, y + cur_v.y * 10);
draw_sprite_ext(spr_vector, image_index, x, y, distance/sprite_get_width(spr_vector), 1, angle, c_white, 1);