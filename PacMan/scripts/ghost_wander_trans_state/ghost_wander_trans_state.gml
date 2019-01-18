if ds_list_size(obj_followers.follower_list) == 0 {
	// creating new trails for the player
	var x_diff = obj_player.x - x;
	var y_diff = obj_player.y - y;
	
	for(var i = 0; i < obj_followers.player_trail_size - 1; i++) {
		// todo - refactor this shit to make it more readable
		obj_followers.player_trail[i, 0] = x_diff != 0 ? obj_player.x - sign(x_diff) * (i + 1) * obj_player.hsp_max : obj_player.x;
		obj_followers.player_trail[i, 1] = y_diff != 0 ? obj_player.y - sign(y_diff) * (i + 1) * obj_player.vsp_max : obj_player.y;
	}
	
	lead_ghost = true;
	ds_list_add(obj_followers.follower_list, id);
	state = ghost_states.FOLLOW;
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

check_collisions();

anim();