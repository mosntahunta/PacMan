// ghost followers list
follower_list = ds_list_create();
max_followers = 100;

// ghost trail
ghost_trail_size = max_followers * TILE_SIZE;
for (var i = 0; i < ghost_trail_size; i++) {
	lead_ghost_trail[i, 0] = 0;
	lead_ghost_trail[i, 1] = 0;
}

// player trail
player_trail_size = TILE_SIZE + 1;
for (var i = 0; i < player_trail_size; i++) {
	player_trail[i, 0] = 0;
	player_trail[i, 1] = 0;
}
