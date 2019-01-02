//
// check collisions
//

if hsp == 0 hsp_decimal = 0;
if vsp == 0 vsp_decimal = 0;

//
// floor decimals
//
// gamemaker allows subpixel movement which does not work with
// tilebased collisions as tiles are lined up to whole pixels
//

// apply carried over decimals
hsp += hsp_decimal;
vsp += vsp_decimal;

// horizontal
hsp_decimal = hsp - (floor(abs(hsp)) * sign(hsp));
hsp -= hsp_decimal;

// vertical
vsp_decimal = vsp - (floor(abs(vsp)) * sign(vsp));
vsp -= vsp_decimal;

//
// apply direction to speed
//
switch next_dir {
	case next_direction.LEFT:
		hsp = -hsp_max;
	break;
	case next_direction.RIGHT:
		hsp = hsp_max;
	break;
	case next_direction.UP:
		vsp = -vsp_max;
	break;
	case next_direction.DOWN:
		vsp = vsp_max;
	break;
}

// face the correct way
if (hsp != 0.0) h_facing = sign(hsp);
if (vsp != 0.0) v_facing = sign(vsp);

//
// horizontal collision detection with tiles
//
var side = 0;
if hsp > 0 {
	side = bbox_right;
} else {
	side = bbox_left;
}

var t1 = tilemap_get_at_pixel(global.map, side + hsp, bbox_top);
var t2 = tilemap_get_at_pixel(global.map, side + hsp, bbox_bottom);
		
if t1 != VOID or t2 != VOID {
	if hsp > 0 {
		x = x - (x mod global.tile_size) + global.tile_size - (side - x) - 1;
	} else {
		x = x - (x mod global.tile_size) - (side - x);
	}
	hsp = 0;
}

// apply speed to x position
x += hsp;

//
// vertical collision detection with tiles
//
if vsp > 0 {
	side = bbox_bottom;
} else {
	side = bbox_top;
}

var t1 = tilemap_get_at_pixel(global.map, bbox_left, side + vsp);
var t2 = tilemap_get_at_pixel(global.map, bbox_right, side + vsp);
		
if t1 != VOID or t2 != VOID {
	if vsp > 0 {
		y = y - (y mod global.tile_size) + global.tile_size - (side - y) - 1;
	} else {
		y = y - (y mod global.tile_size) - (side - y);
	}
	vsp = 0;
}

// apply speed to y position
y += vsp;