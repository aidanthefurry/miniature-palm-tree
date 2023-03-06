// AI object script

// Set these variables to adjust the AI's movement speed and detection range
move_speed = 1.5;
detect_range = 250;

// Define the AI's behavior in the step event
if distance_to_object(obj_Player) <= detect_range {
   // If the player is within range, move towards their center
   var target_x = obj_Player.x;
   var target_y = obj_Player.y;
   move_towards_point(target_x, target_y, move_speed);
} else {
   // If the player is not within range, stop moving and don't lean
   speed = 0;
}

// Keep the AI within the bounds of the room
if x < 0 { x = 0; direction += 180; }
if y < 0 { y = 0; direction += 180; }
if x > room_width { x = room_width; direction += 180; }
if y > room_height { y = room_height; direction += 180; }
