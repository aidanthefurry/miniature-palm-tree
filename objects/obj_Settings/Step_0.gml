window_set_fullscreen(global.fullscreen);

if(gamepad_button_check_pressed(0, gp_start)){
	room_goto(1);
}