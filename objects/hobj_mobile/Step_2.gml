cur_v = calc_new_move_vector()
cur_v = normal_cap_v2(cur_v, global_speed_cap)

x += cur_v.x
y += cur_v.y