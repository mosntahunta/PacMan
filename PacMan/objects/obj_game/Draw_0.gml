// display the score
var gw = display_get_gui_width();
var gh = display_get_gui_height();

var mx = gw / 2;
var my = 10;

draw_text(mx, my, "Score: " + string(score));