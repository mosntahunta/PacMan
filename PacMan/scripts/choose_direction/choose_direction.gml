///< choose the next direction to move for the ghost when it stops

if hsp == 0 and vsp == 0 {
	switch next_dir {
		case LEFT:
			next_dir = choose(LEFT, UP, DOWN);
		break;
		case RIGHT:
			next_dir = choose(RIGHT, UP, DOWN);
		break;
		case UP:
			next_dir = choose(LEFT, RIGHT, UP);
		break;
		case DOWN:
			next_dir = choose(LEFT, RIGHT, DOWN);
		break;
	}
}