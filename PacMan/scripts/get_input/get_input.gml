///< get input

// keyboard input
left  = keyboard_check(vk_left) or keyboard_check(ord("A"));
right = keyboard_check(vk_right) or keyboard_check(ord("D"));
up	  = keyboard_check(vk_up) or keyboard_check(ord("W"));
down  = keyboard_check(vk_down) or keyboard_check(ord("S"));

// controller input
// todo - debug the values to learn how to configure them for different controllers
var _dev = 4; // nintendo switch pro controller, ps4.

if (gamepad_is_connected(_dev)) {
	var _deadzone = 0.3;
	left		= gamepad_axis_value(_dev, gp_axislh) < - _deadzone or left;
	right		= gamepad_axis_value(_dev, gp_axislh) > _deadzone or right;
	up			= gamepad_axis_value(_dev, gp_axislv) < - _deadzone or up;
	down		= gamepad_axis_value(_dev, gp_axislv) > _deadzone or down;
}