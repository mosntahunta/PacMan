//
// ghost chase state
//

var path = path_add();
if mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y, 0) {
	path_start(path, 4, 0, 0);
}