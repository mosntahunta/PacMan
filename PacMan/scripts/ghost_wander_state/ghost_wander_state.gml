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

// look for the player object in an rectangle area around the ghost		   
var found_player_rect = point_in_rectangle(obj_player.x, obj_player.y, x - 3 * TILE_SIZE, y - 3 * TILE_SIZE, x + 3 * TILE_SIZE, y + 3 * TILE_SIZE);
if found_player_rect {
	if alarm[BEGIN_FOLLOW] < 0 alarm[BEGIN_FOLLOW] = to_follow_delay;
}

// animation
anim();