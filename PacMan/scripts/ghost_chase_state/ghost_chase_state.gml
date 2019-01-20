//
// ghost chase state
//

var begin_path = false;
var portal = -1;
with obj_player {
	if last_entered_portal == -1 {
		other.entering_portal = false;
		if distance_to_point(other.prev_dest_x, other.prev_dest_y) > TILE_SIZE {
			begin_path = true;
		}
	} else {
		portal = last_entered_portal;
		begin_path = true;
	}
}

// execute the path from the ghost to the player or the portal
if begin_path and !entering_portal {
	if portal != -1 {
		if mp_grid_path(global.grid, path, x, y, portal.x, portal.y, 0) {
			entering_portal = true;
			path_start(path, 4, 0, 0);
		}
	} else if mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y, 0) {
		path_start(path, 4, 0, 0);
	}
	
	prev_dest_x = obj_player.x;
	prev_dest_y = obj_player.y;
}

// animation
anim();