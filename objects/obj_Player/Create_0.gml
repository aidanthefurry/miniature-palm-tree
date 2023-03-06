spd = 4.57;
jump_power = 13;
x_speed = 0;
y_speed = 0;
grav = .75;

gp_vibration_amount = 0;

can_hit_ground = false;
time_walk_sound = 0;

buffer_count = 0;
buffer_max = 4;

coyote_count = 0;
coyote_max = 6;
jumped = true;

global.battery = 100;

sword = instance_create_layer(x, y, "Instances", obj_Sword);
sword.parent = id; // make the sword object a child of the player object

function kill_the_player(){
	room_restart();
}