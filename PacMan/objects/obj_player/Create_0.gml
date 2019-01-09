///< player input
left = 0;
right = 0;
up = 0;
down = 0;

///< movement speed
hsp_max = 4;
vsp_max = 4;

hsp = 0;
vsp = 0;

hsp_decimal = 0;
vsp_decimal = 0;

///< facing
h_facing = 1; // +ve is right
v_facing = 1; // +ve is down

///< direction to move when collision is no longer detected
next_dir = LEFT;

///< position array
array_size = 50;
for (var i = 0; i < array_size; i++) {
	pos[i, 0] = x;
	pos[i, 1] = y;
}

///< todo: this is temporary for testing the follow state
steps = 0;

///< states
enum player_states
{
	MOVE,
	DIE
}

state = player_states.MOVE;

states_array[player_states.MOVE] = player_move_state;
states_array[player_states.DIE] = player_die_state;

sprites_array[player_states.MOVE] = spr_player_move;
sprites_array[player_states.DIE] = spr_player_die;