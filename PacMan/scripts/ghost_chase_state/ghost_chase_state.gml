//
// ghost chase state
//

// create and execute the path from the ghost to the player
var begin_path = false;
with obj_player {
	var distance_moved = distance_to_object(other) > TILE_SIZE * 2 ? TILE_SIZE * 2 : TILE_SIZE * 10;
	if distance_to_point(other.prev_dest_x, other.prev_dest_y) > distance_moved {
		begin_path = true;
	}
}

if begin_path {
	var path = path_add();
	if mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y, 0) {
		path_start(path, 4, 0, 0);
	}
	prev_dest_x = obj_player.x;
	prev_dest_y = obj_player.y;
}

// check if the ghost is directly behind the player's trail - the follower list
// if so, change the ghost's state to follow
with obj_player {
	if state == player_states.MOVE {
		var x_spacing = hsp != 0 ? h_facing * 5 * TILE_SIZE : 0;
		var y_spacing = vsp != 0 ? v_facing * 5 * TILE_SIZE : 0;
		var dest_x = 0;
		var dest_y = 0;
		
		if !ds_list_empty(follower_list) {
			var last_follower = ds_list_find_value(follower_list, ds_list_size(follower_list) - 1);
			dest_x = last_follower.x - x_spacing;
			dest_y = last_follower.y - y_spacing;
		} else {
			dest_x = x - x_spacing;
			dest_y = y - y_spacing;
		}
		
		if collision_line(x, y, dest_x, dest_y, other, false, false) and (ds_list_size(follower_list) < max_followers) {
			path_end();
			ds_list_add(follower_list, other);
			other.state = ghost_states.FOLLOW;
		}
	}
}

// animation
anim();