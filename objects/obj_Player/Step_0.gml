#region Input

jump = gamepad_button_check_pressed(0, gp_face1);
jump_held = gamepad_button_check(0, gp_face1);
right = gamepad_button_check(0, gp_padr);
left = gamepad_button_check(0, gp_padl);

x_dir = right - left;

var Grounded = place_meeting(x, y + 1, obj_Wall);

#endregion Input
#region Animation

if (x_dir != 0) image_xscale = x_dir;

if (Grounded) {
	if (x_speed != 0) {
		sprite_index = spr_PlayerRun_strip3; 
	} 
	else {
		sprite_index = spr_PlayerIdle_strip2; 
	}
} else {
	sprite_index = spr_PlayerJump;
}

#endregion Animation
#region Jump

y_speed += grav;

//Landing
if(can_hit_ground && Grounded){
	gp_vibration_amount = .025;
	obj_Camera.shake = 1;
	audio_play_sound(s_Land, 1, false);
	can_hit_ground = false;
}else if(!Grounded){
	can_hit_ground = true;
}

//Coyote Time
if (!Grounded){
	if(coyote_count > 0){
		coyote_count -= 1;
		if(!jumped){
			if(jump){
				audio_play_sound(s_Jump, 1, false);
				y_speed -= jump_power;
				jumped = true;
			}
		}
	}
}else{
	jumped = false;
	coyote_count = coyote_max;
}

//Jump Buffer
if (jump){buffer_count = buffer_max;}

if (buffer_count > 0){
	buffer_count -= 1;
	
	if(Grounded){
		audio_play_sound(s_Jump, 1, false);
		y_speed -= jump_power;
		buffer_count = 0;
	}
}

//Variable Jump Height
if(y_speed < 0) && (!jump_held){
	y_speed = max(y_speed, 0);
}

#endregion Jump
#region Movement

//x_speed = x_dir * spd;

if (x_dir > 0 && x_speed < spd){
	x_speed += 1;
}

if (x_dir < 0 && x_speed > -spd){
	x_speed -= 1;
}

if (x_dir == 0){
	if (x_speed > 0)x_speed -= 1;
	if (x_speed < 0)x_speed += 1;
}

//Walking Sound
if(x_speed != 0 && Grounded){if(time_walk_sound <= 0){audio_play_sound(s_FootStep, 1, false);time_walk_sound = 10;}else{time_walk_sound -= 1;}}

#endregion Movment
#region Collison

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

if (place_meeting(x, y, obj_Projectile)){
	kill_the_player();
}

if (place_meeting(x, y, obj_Laser)){
	if(obj_Laser.isActive){
		kill_the_player();
	}
}

if (place_meeting(x, y, obj_AcidCollider)){
	kill_the_player();  
}


if (place_meeting(x, y, obj_Spike)){
	kill_the_player();
}

if (place_meeting(x, y, obj_PatrolEnemy)){
	kill_the_player();
}

if (place_meeting(x, y, obj_FlyingEnemy)){
	kill_the_player();
}

#endregion Collison
#region Vibration

gamepad_set_vibration(0, gp_vibration_amount, gp_vibration_amount);
gp_vibration_amount *= .9;

#endregion
#region PowerUps

if(x_speed != 0){
	global.battery -= delta_time / 1000000 * 5;
}

if(jump){
	global.battery -= 2.5;
}

if(place_meeting(obj_Player.x, obj_Player.y, obj_BatteryLife)){
	with(instance_nearest(x, y, obj_BatteryLife)){
		instance_destroy();
		global.battery = 100;
	}
}

if(place_meeting(obj_Player.x, obj_Player.y, obj_Fuel)){
	with(instance_nearest(x, y, obj_Fuel)){
		instance_destroy();
	}
}

if(place_meeting(obj_Player.x, obj_Player.y, obj_SpeedBoost)){
	with(instance_nearest(x, y, obj_SpeedBoost)){
		instance_destroy();
	}
}

if(place_meeting(obj_Player.x, obj_Player.y, obj_FlooxTape)){
	with(instance_nearest(x, y, obj_FlooxTape)){
		instance_destroy();
		//Let you go underwater
	}
}

if(place_meeting(obj_Player.x, obj_Player.y, obj_Invicabilty)){
	with(instance_nearest(x, y, obj_Invicabilty)){
		instance_destroy();
	}
}

#endregion PowerUps