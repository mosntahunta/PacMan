///< player input
left = 0;
right = 0;
up = 0;
down = 0;

///< movement speed
hsp_max = 4;
vsp_max = 4;

hsp_apply = hsp_max;
vsp_apply = vsp_max;

hsp = 0;
vsp = 0;

hsp_decimal = 0;
vsp_decimal = 0;

///< facing
h_facing = 1; // +ve is right
v_facing = 1; // +ve is down

///< direction to move when collision is no longer detected
next_dir = LEFT;

///< portal entered
last_entered_portal = -1;

///< in slow motion
slowed = false;

flee_timer = room_speed * 10;

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