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
	if other.steps > 150 {
		// update the position of the ghosts that are following
		if state == ghost_states.FOLLOW {
			x = other.pos[30, 0];
			y = other.pos[30, 1];
		}
	}

	if other.steps > 500 {
		state = ghost_states.FLEE;
	}
}

// animation
anim();

steps++;