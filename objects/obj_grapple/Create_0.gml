if (!variable_instance_exists(id, "follow_target")) follow_target	= noone;
if (!variable_instance_exists(id, "target"))		target			= noone;
if (!variable_instance_exists(id, "origin"))		origin			= noone;

retracting		= false;
distance_const	= sprite_half_size * 2;

grapple_distance_scale	= 0;
grapple_sp_mod			= 2;

event_inherited();

id.interp_mod	= 0.1;
id.step_val		= 0.25;
id.sp			= 50;