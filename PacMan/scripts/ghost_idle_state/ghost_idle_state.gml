//
// ghost idle state
//

// look for the player object adjacent to the ghosts
var found_player_adj = place_meeting(x - global.tile_size, y, obj_player) or 
					   place_meeting(x + global.tile_size, y, obj_player) or 
					   place_meeting(x, y - global.tile_size, obj_player) or 
					   place_meeting(x, y + global.tile_size, obj_player);

if found_player_adj and alarm[START_CHASE] < 0 {
	alarm[START_CHASE] = to_chase_delay;
}
	