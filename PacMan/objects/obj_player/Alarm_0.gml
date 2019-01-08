//
// Save the current position to the array
//

for(var i = array_size - 1; i > 0; i--) {
	pos[i, 0] = pos[i - 1, 0];
	pos[i, 1] = pos[i - 1, 1];
}

pos[0, 0] = x;
pos[0, 1] = y;

// update the position of the ghosts that are following
obj_ghost.x = pos[1, 0];
obj_ghost.y = pos[1, 1];