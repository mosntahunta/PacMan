//
// to be called by obj_portal during a collision with another object
//

var dest_portal = -1;

for (var i = 0; i < instance_number(obj_portal); i++) {
	var inst = instance_find(obj_portal, i);
	if links_to == inst.link_id {
		dest_portal = inst;
	}
}

with other {
	switch dest_portal.entrance {
		case entrance_side.LEFT:
			x = dest_portal.bbox_left + sprite_width / 2;
			y = dest_portal.y;
		break;
		case entrance_side.RIGHT:
			x = dest_portal.bbox_right + sprite_width / 2;
			y = dest_portal.y;
		break;
		case entrance_side.TOP:
			x = dest_portal.x;
			y = dest_portal.bbox_top + sprite_height / 2;
		break;
		case entrance_side.BOTTOM:
			x = dest_portal.x;
			y = dest_portal.bbox_bottom + sprite_height / 2 + 1;
		break;
	}
}