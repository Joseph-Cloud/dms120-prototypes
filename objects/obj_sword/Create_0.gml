if (!variable_instance_exists(id, "origin")) origin = noone;
if (!variable_instance_exists(id, "angle")) angle = 0;

angle_accumulator	= 1;

angle_increment		= 15;
origin_distance		= 25;
swing_half_radius	= 60;

var angle1 = (angle + swing_half_radius) % 360;
var angle2 = angle - swing_half_radius < 0 ? 360 + (angle - swing_half_radius) : angle - swing_half_radius;

if ((angle1 + swing_half_radius * 2) % 360 == angle2) {
	starting_angle	= angle1;
	final_angle		= angle2;
} else {
	starting_angle	= angle2;
	final_angle		= angle1;
}

starting_angle = starting_angle - 90 < 0 ? 360 + (starting_angle - 90) : starting_angle - 90;
final_angle = final_angle - 90 < 0 ? 360 + (final_angle - 90) : final_angle - 90;

cur_angle = starting_angle;

image_xscale = 2;
image_yscale = 2;

// handle particle trail
fade_time = 3;
fade_timer = fade_time;