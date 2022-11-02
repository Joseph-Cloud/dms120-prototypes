// Allows for cross object move vector changes
function add_to_mod_v(nmod_v, obj_id) {
	if (!variable_instance_exists(obj_id, "mod_v"))	{ return }
	obj_id.mod_v = add_v2(obj_id.mod_v, nmod_v)
}