if (!variable_instance_exists(id, "follow_target")) follow_target	= noone;
if (!variable_instance_exists(id, "target"))		target			= noone;
if (!variable_instance_exists(id, "origin"))		origin			= noone;

retracting		= false;
distance_const	= sprite_half_size * 2;

grapple_distance_scale	= 0;
grapple_sp			= 30;

event_inherited();

id.interp_mod	= 0.01;
id.interp_const = 0.01;
id.step_val		= 0.25;
id.sp			= 50;