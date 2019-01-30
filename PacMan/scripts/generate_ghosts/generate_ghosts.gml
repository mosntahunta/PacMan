///
/// Create ghost instances on the specified side of the map
///
/// To be called by obj_game
///
/// @argument0 - side
/// @argument1 - type index
///

var side = argument0;
var type = argument1;

if side == LEFT {
	for (var i = 0; i < ds_grid_width(ghost_spawn_left_list[type]); i++) {
		var inst = instance_create_layer(ds_grid_get(ghost_spawn_left_list[type], i, 0), 
								ds_grid_get(ghost_spawn_left_list[type], i, 1), 
								"Instances", 
								obj_ghost);
		show_debug_message("type: " + string(type));
		show_debug_message("x: " + string(ds_grid_get(ghost_spawn_left_list[type], i, 0)));
		show_debug_message("y: " + string(ds_grid_get(ghost_spawn_left_list[type], i, 1)));
		inst.side = side;
		inst.state = ghost_states.IDLE;
		ds_list_add(left_ghosts, inst);
	}
} else if side == RIGHT {
	for (var i = 0; i < ds_grid_width(ghost_spawn_right_list[type]); i++) {
		var inst = instance_create_layer(ds_grid_get(ghost_spawn_right_list[type], i, 0), 
								ds_grid_get(ghost_spawn_right_list[type], i, 1), 
								"Instances", 
								obj_ghost);
		inst.side = side;
		inst.state = ghost_states.IDLE;
		ds_list_add(right_ghosts, inst);
	}
}