///< link to other portals
links_to = -1; // to be set in the room editor
link_id = -1;

///< which side of the portal to enter/exit
enum entrance_side {
	LEFT,
	RIGHT,
	TOP,
	BOTTOM
}

entrance = entrance_side.LEFT;