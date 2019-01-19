//
// ghost flee state
//

if previous_state != ghost_states.IDLE {
	choose_direction();

	apply_speed(hsp_max / 2, vsp_max / 2);

	check_collisions();
}

// animation
anim();