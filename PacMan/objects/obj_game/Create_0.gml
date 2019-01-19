macros();
global.map = layer_tilemap_get_id("Collisions");

global.grid = mp_grid_create(30, 30, (room_width - 60) / 60, (room_height - 60) / 60 , 60, 60);

for(var xx = 30; xx < room_width - 30; xx += 60) {
    for(var yy = 30; yy < room_height - 30; yy += 60) {
        var t1 = tilemap_get_at_pixel(global.map, xx, yy);
        if t1 != VOID {
            mp_grid_add_cell(global.grid, (xx - 30) / 60, (yy - 30) / 60);
        }
    }
}
