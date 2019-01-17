if ds_list_size(obj_followers.follower_list) == 0 {
	// look for the player object adjacent to the ghosts
	var found_player_adj = place_meeting(x - TILE_SIZE, y, obj_player) or 
						   place_meeting(x + TILE_SIZE, y, obj_player) or 
						   place_meeting(x, y - TILE_SIZE, obj_player) or 
						   place_meeting(x, y + TILE_SIZE, obj_player);

	if !found_player_adj {
		lead_ghost = true;
		ds_list_add(obj_followers.follower_list, id);
		state = ghost_states.FOLLOW;
	}
} else {
	var ghost = ds_list_find_value(obj_followers.follower_list, 0); 
	var found_ghost_adj = place_meeting(x - TILE_SIZE, y, ghost) or 
						  place_meeting(x + TILE_SIZE, y, ghost) or 
						  place_meeting(x, y - TILE_SIZE, ghost) or 
						  place_meeting(x, y + TILE_SIZE, ghost);
						  
	if found_ghost_adj {
		ds_list_add(obj_followers.follower_list, id);
		state = ghost_states.FOLLOW;
	}
}
