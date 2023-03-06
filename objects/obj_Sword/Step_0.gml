var melee = gamepad_button_check_pressed(0, gp_face3);

x = obj_Player.x; // update the sword's x position relative to the player
y = obj_Player.y; // update the sword's y position relative to the player

if(obj_Player.x_dir != 0){
	image_xscale = obj_Player.x_dir;
}

// check for attack input
if (melee)
{
    attack = true; // set the attack state to true
    sprite_index = spr_Sword; // change sprite to the attack animation
}

// check for end of attack animation
if (attack && image_index >= 5)
{
    attack = false; // reset the attack state
    sprite_index = spr_SwordIdle; // change sprite back to the idle animation
}

// check for collision with enemies
if (place_meeting(x, y, obj_PatrolEnemy))
{
	with(instance_nearest(x, y, obj_PatrolEnemy)){
		instance_destroy();
		global.battery += 15;
	}
}

// check for collision with enemies
if (place_meeting(x, y, obj_FlyingEnemy))
{
	with(instance_nearest(x, y, obj_FlyingEnemy)){
		instance_destroy();
		global.battery += 15;
	}
}