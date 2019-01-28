score += FRUIT_SCORE;
with other {
	if !has_collided {
		with obj_game {
			var random_number = irandom(3);
			if other.side == LEFT { 
				generate_coins(RIGHT, random_number);
			} else if other.side == RIGHT { 
				generate_coins(LEFT, random_number);
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