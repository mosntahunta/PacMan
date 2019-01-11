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

// animation
anim();