///< apply speed
hsp_value = argument0;
vsp_value = argument1;

switch next_dir {
	case LEFT:
		hsp = -hsp_value;
	break;
	case RIGHT:
		hsp = hsp_value;
	break;
	case UP:
		vsp = -vsp_value;
	break;
	case DOWN:
		vsp = vsp_value;
	break;
}