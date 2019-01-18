// update the player trail based on its current position
with obj_player {
	if state == player_states.MOVE {
		for(var i = other.player_trail_size - 1; i > 0; i--) {
			other.player_trail[i, 0] = other.player_trail[i - 1, 0];
			other.player_trail[i, 1] = other.player_trail[i - 1, 1];
		}

		other.player_trail[0, 0] = x;
		other.player_trail[0, 1] = y;
	}
}

// update the lead ghost's position based on the player's position array
// and record the ghost's trail
with obj_ghost {
	if lead_ghost and state = ghost_states.FOLLOW {
		x = other.player_trail[TILE_SIZE, 0];
		y = other.player_trail[TILE_SIZE, 1];
		
		for(var i = other.ghost_trail_size - 1; i > 0; i--) {
			other.lead_ghost_trail[i, 0] = other.lead_ghost_trail[i - 1, 0];
			other.lead_ghost_trail[i, 1] = other.lead_ghost_trail[i - 1, 1];
		}

		other.lead_ghost_trail[0, 0] = x;
		other.lead_ghost_trail[0, 1] = y;
	}
}
	
// update the positions of the following ghosts
if ds_list_size(follower_list) > 1 {
	// update other ghosts position based on lead ghost's trail
	for(var pos = 1; pos < ds_list_size(follower_list); pos++) {
		var ghost = ds_list_find_value(follower_list, pos);
		var array_pos = (TILE_SIZE / 2) * pos;
			
		ghost.x = lead_ghost_trail[array_pos, 0];
		ghost.y = lead_ghost_trail[array_pos, 1];
	}
}