///
/// Create coin instances on the specified side of the map
///
/// To be called by obj_game
///
/// @argument0 - side
/// @argument1 - type index
///

var side = argument0;
var type = argument1;

if side == LEFT {
	for (var i = 0; i < ds_grid_width(coin_spawn_left_list[type]); i++) {
		var inst = instance_create_layer(ds_grid_get(coin_spawn_left_list[type], i, 0), 
								ds_grid_get(coin_spawn_left_list[type], i, 1), 
								"Items", 
								obj_coin);
		inst.side = side;
		ds_list_add(left_coins, inst);
	}
} else if side == RIGHT {
	for (var i = 0; i < ds_grid_width(coin_spawn_right_list[type]); i++) {
		var inst = instance_create_layer(ds_grid_get(coin_spawn_right_list[type], i, 0), 
								ds_grid_get(coin_spawn_right_list[type], i, 1), 
								"Items", 
								obj_coin);
		inst.side = side;
		ds_list_add(right_coins, inst);
	}
}