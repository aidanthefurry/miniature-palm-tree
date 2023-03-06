// Create an instance of the projectile
var inst = instance_create_layer(x, y, "Projectiles", obj_Projectile);

// Set the direction and speed of the projectile based on the angle of the turret
inst.direction = image_angle;
inst.speed = 4; // Change this value to adjust the speed of the projectile

// Reset the alarm to the specified fire rate
alarm[0] = fire_rate;