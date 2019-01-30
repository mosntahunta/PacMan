///
/// Remove the ghost from the side lists
///

var ghost = argument0;

if ghost.side == LEFT {
	var index = ds_list_find_index(obj_game.left_ghosts, ghost);
	if index != -1 {
		ds_list_delete(obj_game.left_ghosts, index);
	}
} else if ghost.side == RIGHT {
	var index = ds_list_find_index(obj_game.right_ghosts, ghost);
	if index != -1 {
		ds_list_delete(obj_game.right_ghosts, index);
	}
}