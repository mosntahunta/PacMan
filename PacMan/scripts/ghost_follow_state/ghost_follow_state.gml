// update the ghost's position based on the player's position array
with obj_player {
	if state == player_states.MOVE {
		var position = ds_list_find_index(follower_list, other);
		if position != -1 and position < max_followers {
			var array_pos = (TILE_SIZE / 2) * position + TILE_SIZE;
			other.x = pos[array_pos, 0];
			other.y = pos[array_pos, 1];
		}
	}
}

// animation
anim();