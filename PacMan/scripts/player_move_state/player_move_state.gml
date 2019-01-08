// key input
get_input();

// movement
calc_movement();

// apply movement
check_collisions();

if alarm[SAVE_POS] < 0 {
	alarm[SAVE_POS] = save_pos_timer;
}

// animation
anim();