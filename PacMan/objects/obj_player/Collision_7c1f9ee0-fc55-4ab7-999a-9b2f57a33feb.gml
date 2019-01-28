score += COIN_SCORE;
if !other.has_collided {
	with other {
		if side == LEFT {
			ds_list_delete(obj_game.left_coins, ds_list_find_index(obj_game.left_coins, id));
			if ds_list_empty(obj_game.left_coins) {
				var inst = instance_create_layer(1320, 300, "Items", obj_fruit);
				inst.side = RIGHT;
			}
		} else if side == RIGHT {
			ds_list_delete(obj_game.right_coins, ds_list_find_index(obj_game.right_coins, id));
			if ds_list_empty(obj_game.right_coins) {
				var inst = instance_create_layer(600, 780, "Items", obj_fruit);
				inst.side = LEFT;
			}
		}
		has_collided = true;
		instance_destroy();
	}
}