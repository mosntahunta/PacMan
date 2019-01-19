///< slow down the player and the ghost when they are facing eachother and really close

with obj_player {
	if facing_ghost() and distance_to_object(obj_ghost) < TILE_SIZE * 2 {
		other.hsp = other.hsp / 25;
		other.vsp = other.vsp / 25;
		hsp = hsp / 2;
		vsp = vsp / 2;
	}
}