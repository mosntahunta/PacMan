//
// ghost idle state
//

if find_obj_adjacent(TILE_SIZE, obj_player) {
	state = ghost_states.IDLE_TRANSITION;
}

anim();