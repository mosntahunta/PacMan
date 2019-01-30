with other {
	if state == ghost_states.FLEE {
		remove_ghost_from_side(id);
		instance_destroy();
		score += GHOST_SCORE;
	} else {
		other.state = player_states.DIE;
	}
}