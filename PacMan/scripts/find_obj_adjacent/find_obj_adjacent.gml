///< find a given object adjacent to the caller

var distance = argument0;
var obj_to_find = argument1;

return place_meeting(x - distance, y, obj_to_find) or 
	   place_meeting(x + distance, y, obj_to_find) or 
	   place_meeting(x, y - distance, obj_to_find) or 
	   place_meeting(x, y + distance, obj_to_find);