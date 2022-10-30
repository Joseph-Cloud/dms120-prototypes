// Create player cursor
cursor = instance_create_layer(x, y, layer, obj_cursor,
{
	follow_target: id
})
// Instantiate empty grapple
grapple = noone

// Inherit the parent event
event_inherited()

