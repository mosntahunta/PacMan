if ds_list_size(obj_followers.follower_list) == 0 {
	if !find_obj_adjacent(TILE_SIZE, obj_player) {
		ds_list_add(obj_followers.follower_list, id);
		if alarm[BEGIN_CHASE] < 0 alarm[BEGIN_CHASE] = to_chase_delay;
	}
} else {
	var ghost = ds_list_find_value(obj_followers.follower_list, 0); 
	if find_obj_adjacent(TILE_SIZE, ghost) {
		ds_list_add(obj_followers.follower_list, id);
		state = ghost_states.FOLLOW;
	}
}
