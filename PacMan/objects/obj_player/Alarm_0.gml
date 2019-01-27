with obj_ghost {
	if state == ghost_states.FLEE {
		if previous_state == ghost_states.IDLE or previous_state == ghost_states.IDLE_TRANSITION {
			state = ghost_states.IDLE;
		} else {
			state = ghost_states.WANDER;
		}
	}
}