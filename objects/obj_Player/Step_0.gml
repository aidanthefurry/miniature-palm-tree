var jump = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);
var on_the_ground = place_meeting(x, y + 1, obj_Wall);
var right = keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_button_check(0, gp_padr);
var left = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check(0, gp_padl);
var x_dir = right - left;
//OWO

if (x_dir != 0) image_xscale = x_dir;

x_speed = x_dir * spd;

y_speed++;

if (on_the_ground) {
	if (x_speed != 0) {
		sprite_index = spr_PlayerRun_strip6; 
	} 
	else {
		sprite_index = spr_PlayerIdle_strip4; 
	}
	if (jump) {
		y_speed = -15;
	}
} else {
	sprite_index = spr_PlayerJump;
}

if (place_meeting(x + x_speed, y, obj_Wall)) { 
	while (!place_meeting(x + sign(x_speed), y, obj_Wall)) {
		x += sign(x_speed);
	}
	x_speed = 0; 
}
x += x_speed;

if (place_meeting(x, y + y_speed, obj_Wall)) { 
	while (!place_meeting(x, y + sign(y_speed), obj_Wall)) {
		y += sign(y_speed);
	}
	y_speed = 0; 
}

y += y_speed;

#region Vibration

gamepad_set_vibration(0, gp_vibration_amount, gp_vibration_amount);
gp_vibration_amount *= .95;

#endregion