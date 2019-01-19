// update the lead ghost's position based on the player's position array
// and record the ghost's trail
with obj_ghost {
	if state = ghost_states.CHASE {
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