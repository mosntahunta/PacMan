// key input
get_input();

// movement
calc_movement();

// apply speed
apply_speed(hsp_max, vsp_max);

// check collisions
check_collisions();

// test code for the ghost's flee state
if keyboard_check_pressed(vk_space) {
	with obj_ghost {
		if state == ghost_states.FLEE {
			state = previous_state == ghost_states.FOLLOW ? ghost_states.CHASE : previous_state;
		} else {
			// remove the ghost from the follower list
			var index = ds_list_find_index(other.follower_list, id);
			if index != -1 {
				ds_list_delete(other.follower_list, index);
			}
			previous_state = state;
			state = ghost_states.FLEE;
		}
	}
}

// ghosts following
for(var i = array_size - 1; i > 0; i--) {
	pos[i, 0] = pos[i - 1, 0];
	pos[i, 1] = pos[i - 1, 1];
}

pos[0, 0] = x;
pos[0, 1] = y;

// animation
anim();