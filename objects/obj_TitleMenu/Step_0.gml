up_key = gamepad_button_check_pressed(0, gp_padu);
down_key = gamepad_button_check_pressed(0, gp_padd);
accept_key = gamepad_button_check_pressed(0, gp_face1);

op_length = array_length(option[menu_level]);

pos += down_key - up_key;
if(pos >= op_length){pos = 0;}
if(pos < 0){pos = op_length - 1;}

if(accept_key){
	var _sml = menu_level;
	
	switch(menu_level){
		//Title Screen
		case 0: switch(pos){
			//Start
			case 0: room_goto_next(); break;
			//Options
			case 1: menu_level = 1 break;
			//Quit
			case 2: game_end(); break;
		}
		break;
		//Options Menu
		case 1: switch(pos){
			//Fullscreen
			case 0: if(!global.fullscreen){
						global.fullscreen = true;
					}else{
						global.fullscreen = false;
					}
					
			break;
			//Back
			case 1: menu_level = 0 break;
		}
		break;
	}
		
	if(_sml != menu_level) {pos = 0};
	
	op_length = array_length(option[menu_level]);
}