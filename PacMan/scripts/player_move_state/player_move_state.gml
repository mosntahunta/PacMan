// key input
get_input();

// movement
calc_movement();

// apply movement
check_collisions();

// ghosts following
for(var i = array_size - 1; i > 0; i--) {
	pos[i, 0] = pos[i - 1, 0];
	pos[i, 1] = pos[i - 1, 1];
}

pos[0, 0] = x;
pos[0, 1] = y;

with obj_ghost {
	// update the position of the ghosts that are following
	if state == ghost_states.FOLLOW {
		var position = ds_list_find_index(other.follower_list, id);
			
		if position != -1 and position < other.max_followers {
			var array_pos = (TILE_SIZE / 2) * position + TILE_SIZE;
			x = other.pos[array_pos, 0];
			y = other.pos[array_pos, 1];
		}
	} else if state == ghost_states.CHASE {
		var x_spacing = other.hsp != 0 ? other.h_facing * TILE_SIZE * 3 : 0;
		var y_spacing = other.vsp != 0 ? other.v_facing * TILE_SIZE * 3 : 0;
		var dest_x = 0;
		var dest_y = 0;
		
		if !ds_list_empty(other.follower_list) {
			var last_follower = ds_list_find_value(other.follower_list, ds_list_size(other.follower_list) - 1);
			dest_x = last_follower.x - x_spacing;
			dest_y = last_follower.y - y_spacing;
		} else {
			dest_x = other.x - x_spacing;
			dest_y = other.y - y_spacing;
		}
		
		if collision_line(other.x, other.y, dest_x, dest_y, obj_ghost, false, false) and (ds_list_size(other.follower_list) < other.max_followers) {
			ds_list_add(other.follower_list, id);
			state = ghost_states.FOLLOW;
		}
	}
			
}

// animation
anim();