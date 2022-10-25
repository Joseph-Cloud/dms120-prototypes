// reinit mod_v
mod_v  = new Vector2(0, 0)

// Each frame, degrade the interp mod towards the interp_const
interp_mod = max(interp_mod - interp_degrade_rate, interp_const)