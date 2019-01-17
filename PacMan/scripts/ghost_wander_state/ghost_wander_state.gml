//
// ghost wander state
//

if hsp == 0 and vsp == 0 {
	switch next_dir {
		case LEFT:
			next_dir = choose(LEFT, UP, DOWN);
		break;
		case RIGHT:
			next_dir = choose(RIGHT, UP, DOWN);
		break;
		case UP:
			next_dir = choose(LEFT, RIGHT, UP);
		break;
		case DOWN:
			next_dir = choose(LEFT, RIGHT, DOWN);
		break;
	}
}

apply_speed(hsp_max, vsp_max);

check_collisions();

// look ahead for the player object
var x2 = hsp != 0 ? x + sign(hsp) * TILE_SIZE * 4 : x;
var y2 = vsp != 0 ? y + sign(vsp) * TILE_SIZE * 4 : y;

var player = collision_line( x, y, x2 , y2, obj_player, false, true );
if player != noone {
	state = ghost_states.WANDER_TRANSITION;
}

// animation
anim();