if ds_list_size(obj_followers.follower_list) == 0 {
	ds_list_add(obj_followers.follower_list, id);
	obj_player.last_entered_portal = -1;
	state = ghost_states.CHASE;
} else {
	var ghost = ds_list_find_value(obj_followers.follower_list, 0);
					   
	if find_obj_adjacent(TILE_SIZE, ghost) {
		ds_list_add(obj_followers.follower_list, id);
		state = ghost_states.FOLLOW;
	}
}

// continue moving
choose_direction();

apply_speed(hsp_max, vsp_max);

apply_slow_motion();

check_collisions();

anim();