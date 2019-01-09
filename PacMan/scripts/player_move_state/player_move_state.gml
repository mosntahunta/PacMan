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

if steps > 200 {
	// update the position of the ghosts that are following
	if obj_ghost.state == ghost_states.FOLLOW {
		obj_ghost.x = pos[30, 0];
		obj_ghost.y = pos[30, 1];
	}
}

// animation
anim();

steps++;