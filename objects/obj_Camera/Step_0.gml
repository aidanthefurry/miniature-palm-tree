var xCam = clamp(obj_Player.x - wCam / 2, 0, room_width - wCam);
var yCam = clamp(obj_Player.y - hCam / 2, 0, room_height - hCam);

var curX = camera_get_view_x(view_camera[0]);
var curY = camera_get_view_y(view_camera[0]);

var newX = lerp(curX, xCam, 0.1);
var newY = lerp(curY, yCam, 0.1);

// Shake
var randX = random_range(-shake, shake);
var randY = random_range(-shake, shake);

camera_set_view_pos(view_camera[0], newX + randX, newY + randY);

shake *= .9;

layer_x(layer_get_id("Background"), newX * .65);
layer_y(layer_get_id("Background"), newY * .65);