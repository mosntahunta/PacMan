image_index = 0;
image_speed = 0;

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

///< pathing to obj_player
prev_dest_x = 0;
prev_dest_y = 0;

///< transition timers
to_chase_delay = 30;

///< states
enum ghost_states
{
	IDLE,
	WANDER,
	FOLLOW,
	CHASE,
	FLEE
}

state = ghost_states.IDLE;
previous_state = ghost_states.IDLE;

states_array[ghost_states.IDLE] = ghost_idle_state;
states_array[ghost_states.WANDER] = ghost_wander_state;
states_array[ghost_states.FOLLOW] = ghost_follow_state;
states_array[ghost_states.CHASE] = ghost_chase_state;
states_array[ghost_states.FLEE] = ghost_flee_state;

sprites_array[ghost_states.IDLE] = spr_ghost_idle;
sprites_array[ghost_states.WANDER] = spr_ghost_wander;
sprites_array[ghost_states.FOLLOW] = spr_ghost_follow;
sprites_array[ghost_states.CHASE] = spr_ghost_chase;
sprites_array[ghost_states.FLEE] = spr_ghost_flee;