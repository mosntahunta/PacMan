//
// ghost chase state
//

var begin_path = false;

with obj_player {
	var distance_moved = distance_to_object(other) > TILE_SIZE * 2 ? TILE_SIZE * 2 : TILE_SIZE * 10;
	if distance_to_point(other.prev_dest_x, other.prev_dest_y) > distance_moved {
		begin_path = true;
	}
}

if begin_path {
	var path = path_add();
	if mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y, 0) {
		path_start(path, 4, 0, 0);
	}
	prev_dest_x = obj_player.x;
	prev_dest_y = obj_player.y;
}

// animation
anim();