///< calculate movement

if right - left < 0 {
	next_dir = next_direction.LEFT;
} else if right - left > 0 {
	next_dir = next_direction.RIGHT;
} else if down - up < 0 {
	next_dir = next_direction.UP;
} else if down - up > 0 {
	next_dir = next_direction.DOWN;
}