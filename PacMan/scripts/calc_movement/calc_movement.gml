///< calculate movement

if right - left < 0 {
	next_dir = LEFT;
} else if right - left > 0 {
	next_dir = RIGHT;
} else if down - up < 0 {
	next_dir = UP;
} else if down - up > 0 {
	next_dir = DOWN;
}