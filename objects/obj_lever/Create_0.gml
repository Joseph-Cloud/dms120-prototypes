event_inherited();

id.grapple_weight = GrappleWeight.Interactive;
id.interact = function() {
	if (sprite_index == spr_lever_activated) return;
	if (variable_instance_exists(tied_obj, "interact")) {
		tied_obj.interact();
	}
	sprite_index = spr_lever_activated;
}