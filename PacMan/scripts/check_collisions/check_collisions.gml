//
// check collisions
//

// face the correct way
if (hsp != 0.0) h_facing = sign(hsp);
if (vsp != 0.0) v_facing = sign(vsp);

image_xscale = h_facing;
image_yscale = v_facing;

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
		x = x - (side mod TILE_SIZE) + TILE_SIZE - 1;
	} else {
		x = x - (side mod TILE_SIZE);
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
		y = y - (side mod TILE_SIZE) + TILE_SIZE - 1;
	} else {
		y = y - (side mod TILE_SIZE);
	}
	vsp = 0;
}

// apply speed to y position
y += vsp;