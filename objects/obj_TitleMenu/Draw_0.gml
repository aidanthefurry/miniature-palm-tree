var _new_x = 0;
for(var i = 0; i < op_length; i++){
	var _op_x = string_width(option[menu_level, i]);
	_new_x = max(_new_x, _op_x);
}
width = _new_x + op_border * 2;
height = op_border*2 + string_height(option[0, 0]) + (op_length - 1) * op_space;

x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - width / 2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 - height / 2;

draw_sprite_ext(spr_UI, -1, x, y, width / sprite_width, height / sprite_height, 0, c_white, 1);

draw_set_font(font_custom);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

if(global.fullscreen){
	option[1, 0] = ("Fullscreen: true");
}else{
	option[1, 0] = ("Fullscreen: false");
}

for(var i = 0; i < op_length; i++){
	var _c = c_white;
	if(pos == i){_c = c_purple} 
	draw_text_color(x + op_border, y + op_border + op_space * i, option[menu_level, i], _c, _c, _c, _c, 1 );
}