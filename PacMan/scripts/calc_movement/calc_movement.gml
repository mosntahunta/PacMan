///< calculate movement
hsp += (right - left) * hsp_max;
vsp += (down - up) * vsp_max;

// drag
hsp = lerp(hsp, 0, drag);
vsp = lerp(vsp, 0, drag);

// stop
//if( abs(hsp) <= 0.1 ) hsp = 0;

// face the correct way
if (hsp != 0.0) h_facing = sign(hsp);
if (vsp != 0.0) v_facing = sign(vsp);

// limit the speed
hsp = min(abs(hsp), hsp_max) * h_facing;
vsp = min(abs(vsp), vsp_max) * v_facing;