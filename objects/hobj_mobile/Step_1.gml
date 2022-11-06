// Degrade interp_mod towards the interp_const
interp_mod = max(interp_mod - interp_degrade_rate, interp_const);

// Reset vectors
nmove_v = new Vector2(0, 0);
mod_v	= new Vector2(0, 0);