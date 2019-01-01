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
// horizontal collision
//
var h_side;
// determine which side to test
if (hsp > 0) {
	h_side = bbox_right; 
} else {
	h_side = bbox_left;
}

// check top and bottom of side
var t1 = tilemap_get_at_pixel(global.map, h_side + hsp, bbox_top);
var t2 = tilemap_get_at_pixel(global.map, h_side + hsp, bbox_bottom);

// collision found
if  t1 != VOID or t2 != VOID {
	//if hsp > 0 {
	//	x = x - (x mod global.tile_size) + global.tile_size - (h_side - x) - 1;
	//} else {
	//	x = x - (x mod global.tile_size) - (h_side - x);
	//}
	hsp = 0;
}

//
// vertical collision
//
var v_side;
// determine which side to test
if (vsp > 0) {
	v_side = bbox_bottom; 
} else {
	v_side = bbox_top;
}

// check top and bottom of side
var t1 = tilemap_get_at_pixel(global.map, bbox_left, v_side + vsp);
var t2 = tilemap_get_at_pixel(global.map, bbox_right, v_side + vsp);

// collision found
if  t1 != VOID or t2 != VOID {
	//if vsp > 0 {
	//	y = y - (y mod global.tile_size) + global.tile_size - (v_side - y) - 1;
	//} else {
	//	y = y - (y mod global.tile_size) - (v_side - y);
	//}
	vsp = 0;
}

x += hsp;
y += vsp;