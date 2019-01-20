//
// ghost wander state
//

choose_direction();

apply_speed(hsp_max, vsp_max);

apply_slow_motion();

check_collisions();

// look ahead for the player object
var x2 = hsp != 0 ? x + sign(hsp) * TILE_SIZE * 8 : x;
var y2 = vsp != 0 ? y + sign(vsp) * TILE_SIZE * 8 : y;

var player = collision_line( x, y, x2 , y2, obj_player, false, true );
if player != noone {
	state = ghost_states.WANDER_TRANSITION;
}

// animation
anim();