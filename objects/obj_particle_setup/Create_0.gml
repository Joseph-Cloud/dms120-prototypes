particle_system = part_system_create();
part_system_depth(particle_system, 100);

particle_type_sword_fade = part_type_create();

part_type_sprite(particle_type_sword_fade, spr_sword, 0, 0, 1);
part_type_size(particle_type_sword_fade, 1, 1, 0, 0);
part_type_life(particle_type_sword_fade, 20, 20);
part_type_alpha3(particle_type_sword_fade, 0.5, 0.1, 0);
part_type_color1(particle_type_sword_fade, c_blue);