if(global.battery >= 75){
	draw_sprite_ext(spr_BatteryGUI, 0, x + 12, y - 8, 2, 2, 0, -1, 1);
}else if (global.battery >= 50){
	draw_sprite_ext(spr_BatteryGUI, 1, x + 12, y - 8, 2, 2, 0, -1, 1);
}else if (global.battery >= 25){
	draw_sprite_ext(spr_BatteryGUI, 2, x + 12, y - 8, 2, 2, 0, -1, 1);
}else if (global.battery >= 0){
	draw_sprite_ext(spr_BatteryGUI, 3, x + 12, y - 8, 2, 2, 0, -1, 1);
}else if (global.battery <= 0){
	draw_sprite_ext(spr_BatteryGUI, 4, x + 12, y - 8, 2, 2, 0, -1, 1);
}

draw_sprite_ext(spr_PowerUpGUI, 4, x + 90, y + 16, 2.5, 2.5, 0, -1, 1);

draw_set_font(font_custom);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if(global.battery >= 0){
	draw_text_ext_transformed(x + 43, y + 70, string(round(global.battery)), -1, -1, 2, 2, -1);
}else{
	draw_text_ext_transformed(x + 43, y + 70, 0, -1, -1, 2, 2, -1);
}