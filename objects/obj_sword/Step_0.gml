if ((cur_angle < final_angle && cur_angle + angle_increment > final_angle)
	|| (cur_angle > final_angle && cur_angle + angle_increment < final_angle)
	|| cur_angle == final_angle) {
	instance_destroy(id);
}

var increment = angle_increment * (1 - angle_accumulator / (2 * swing_half_radius));
angle_accumulator += increment;

cur_angle += increment;
cur_angle %= 360;

x = origin.x - (origin_distance * sin(degtorad(cur_angle)));
y = origin.y - (origin_distance * cos(degtorad(cur_angle)));
image_angle = cur_angle;


// handle particle trail
if (abs(cur_angle - starting_angle) < 5) return;

fade_timer--;

if (fade_timer <= 0) {
	fade_timer = fade_time;
	
	part_type_size(obj_particle_setup.particle_type_sword_fade, 2, 2, 0, 0);
	part_type_orientation(obj_particle_setup.particle_type_sword_fade, cur_angle, cur_angle, 0, 0, 0)
	part_particles_create(obj_particle_setup.particle_system, origin.x - (origin_distance * sin(degtorad(cur_angle))), origin.y -(origin_distance * cos(degtorad(cur_angle))), obj_particle_setup.particle_type_sword_fade, 1);
}