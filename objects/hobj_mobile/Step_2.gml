cur_v = calc_new_move_vector(nmove_v, move_v, prev_v, cur_v, mod_v, interp_mod, time, time_scale)
cur_v = normal_cap_v2(cur_v, global_speed_cap)

x += cur_v.x
y += cur_v.y