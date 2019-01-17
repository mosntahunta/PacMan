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
			state = previous_state;
		} else {
			// remove the ghost from the follower list
			var index = ds_list_find_index(obj_followers.follower_list, id);
			if index != -1 {
				ds_list_delete(obj_followers.follower_list, index);
			}
			previous_state = state;
			state = ghost_states.FLEE;
		}
	}
}

// animation
anim();