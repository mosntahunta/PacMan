//
// ghost idle state
//

// look for the player object adjacent to the ghosts
var found_player_adj = place_meeting(x - TILE_SIZE, y, obj_player) or 
					   place_meeting(x + TILE_SIZE, y, obj_player) or 
					   place_meeting(x, y - TILE_SIZE, obj_player) or 
					   place_meeting(x, y + TILE_SIZE, obj_player);

if found_player_adj and alarm[START_CHASE] < 0 {
	alarm[START_CHASE] = to_chase_delay;
}

anim();