with other {
	if state == ghost_states.FLEE {
		instance_destroy();
		score += GHOST_SCORE;
	} else {
		other.state = player_states.DIE;
	}
}