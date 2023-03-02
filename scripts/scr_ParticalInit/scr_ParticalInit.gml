gml_pragma("global", "scr_ParticalInit()");

var _p = part_type_create();

part_system_depth(_p, 0);
part_system_position(_p, room_width / 2, room_height / 2);
part_type_shape(_p, pt_shape_square);
part_type_scale(_p, 1, 1);
part_type_size(_p,0.10,0.15,-.001,0);
part_type_color2(_p,8454143,65280);
part_type_alpha2(_p,1,0.75);
part_type_speed(_p,0.1,0.5,0,0);
part_type_direction(_p,0,359,0,0);
part_type_gravity(_p,0.02,90);
part_type_orientation(_p,0,359,10,0,true);
part_type_life(_p,100,150);
part_type_blend(_p,true);

global.jumpParticle = _p;