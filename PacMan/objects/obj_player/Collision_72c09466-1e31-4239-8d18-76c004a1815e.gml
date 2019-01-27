score += CANDY_SCORE;
with other {
	instance_destroy();
}

with obj_ghost {
	// remove the ghost from the follower list
	var index = ds_list_find_index(obj_followers.follower_list, id);
	if index != -1 {
		ds_list_delete(obj_followers.follower_list, index);
	}

	// change to the flee state
	previous_state = state;
	state = ghost_states.FLEE;
}

alarm[GHOST_FLEE] = flee_timer;