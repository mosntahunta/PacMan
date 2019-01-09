with other {
	if state == ghost_states.FLEE {
		instance_destroy();
	} else {
		other.state = player_states.DIE;
	}
}