with obj_followers {
	ds_list_add(follower_list, other);
			
	// adding to the list for the first time
	if ds_list_size(follower_list) == 1 {
		other.lead_ghost = true;
	}	
}

state = ghost_states.FOLLOW;