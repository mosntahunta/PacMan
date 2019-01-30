score += FRUIT_SCORE;
with other {
	if !has_collided {
		with obj_game {
			var random_number = irandom(3);
			if other.side == LEFT { 
				generate_coins(RIGHT, random_number);
				if !ds_list_empty(right_ghosts) {
					for(var i = 0; i < ds_list_size(right_ghosts); i++) {
						instance_destroy(ds_list_find_value(right_ghosts, i));
					}
					ds_list_clear(right_ghosts);
				}
				generate_ghosts(RIGHT, random_number);
			} else if other.side == RIGHT { 
				generate_coins(LEFT, random_number);
				if !ds_list_empty(left_ghosts) {
					for(var i = 0; i < ds_list_size(left_ghosts); i++) {
						instance_destroy(ds_list_find_value(left_ghosts, i));
					}
					ds_list_clear(left_ghosts);
				}
				generate_ghosts(LEFT, random_number);
			}
			
			num_fruits_eaten++;
			if num_fruits_eaten % 7 == 0 and num_fruits_eaten != 0 {
				if other.side == LEFT { 
					instance_create_layer(1320, 780, "Items", obj_candy);
				} else if other.side == RIGHT { 
					instance_create_layer(600, 300, "Items", obj_candy);
				}
			}
		}
		has_collided = true;
		instance_destroy();
	}
}