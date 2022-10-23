key_left = keyboard_check(ord("A"))
key_right = keyboard_check(ord("D"))
key_up = keyboard_check(ord("W"))
key_down = keyboard_check(ord("S"))
key_grapple = keyboard_check(ord("X"))

var h_move = key_right - key_left
var v_move = key_down - key_up
var mod_v  = new Vector2(0, 0)

var interp_mod = interp_const

if (key_grapple) {
	if (player_state == PlayerState.Grapple) {
		player_state = PlayerState.Idle
		grapple_distance_scale = 0
		grapple_target = noone
	}
	else {
		var grapple_target_list = ds_list_create()
		collision_point_list(obj_cursor.x, obj_cursor.y, obj_physics, false, true, grapple_target_list, false)
		show_debug_message(json_encode(grapple_target_list))
		for (var i = 0; ds_list_size(grapple_target_list); i++) {
			var target = ds_list_find_value(grapple_target_list, i)
			//if (!variable_instance_exists(ds_list_find_value(grapple_target_list, i), "grappleable")
			if (target.grappleable) {
				grapple_target = target
				break;
			}
		}
		show_debug_message("Grapple Target")
		show_debug_message(grapple_target)
		if (grapple_target != noone) {
			player_state = PlayerState.Grapple
			grapple_distance_scale = abs(sqrt(sqr(grapple_target.x - x) + sqr(grapple_target.y - y)))
		}
	}
}

if (player_state == PlayerState.Grapple) {
	/*if (colliding with target) player_state = PlayerState.Move*/
	grapple_vector = new Vector2(grapple_target.x - x, grapple_target.y - y)
	show_debug_message("Grapple Vector")
	show_debug_message(grapple_vector.x)
	show_debug_message(grapple_vector.y)
	grapple_distance = magnitude_v2(grapple_vector)
	show_debug_message("Grapple Distance")
	show_debug_message(grapple_distance)
	show_debug_message("/")
	show_debug_message(grapple_distance_scale)
	grapple_mod_vector = scale_v2(grapple_vector, (1 - grapple_distance/grapple_distance_scale) * grapple_speed_mod)
	show_debug_message("Grapple Mod Vector")
	show_debug_message(grapple_mod_vector.x)
	show_debug_message(grapple_mod_vector.y)
	mod_v = add_v2(mod_v, grapple_mod_vector)
}

new_mv = scale_v2(unit_v2(new Vector2(h_move, v_move)), sp)
cur_v = calc_current_vector_dynamic(new_mv, mod_v, interp_mod)
if (magnitude_v2(cur_v) > sp && 
   (player_state == PlayerState.Idle || player_state == PlayerState.Move))
	cur_v = normalize_v2(cur_v, sp)

x += cur_v.x
y += cur_v.y