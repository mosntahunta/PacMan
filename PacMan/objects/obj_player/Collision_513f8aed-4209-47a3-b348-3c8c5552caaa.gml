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
		}
		show_debug_message("fruit destroyed: " + string(id));
		has_collided = true;
		instance_destroy();
	}
}