///< slow down the player and the ghost when they are facing eachother and really close

with obj_player {
	if facing_ghost() and distance_to_object(obj_ghost) < TILE_SIZE * 2 {
		other.hsp = other.hsp / 10;
		other.vsp = other.vsp / 10;
		hsp = hsp / 5;
		vsp = vsp / 5;
	}
}