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
next_dir = next_direction.LEFT;

enum next_direction {
	LEFT,
	RIGHT,
	UP,
	DOWN
}