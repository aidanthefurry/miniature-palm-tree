x_speed = dir * spd;
y_speed += grav;

if (place_meeting(x + x_speed, y, obj_Wall)) { 
	while (!place_meeting(x + sign(x_speed), y, obj_Wall)) {
		x += sign(x_speed);
	}
	x_speed = 0; 
	
	dir *= -1;
}

image_xscale = dir;

x += x_speed;

if (place_meeting(x, y + y_speed, obj_Wall)) { 
	while (!place_meeting(x, y + sign(y_speed), obj_Wall)) {
		y += sign(y_speed);
	}
	y_speed = 0; 
}

y += y_speed;