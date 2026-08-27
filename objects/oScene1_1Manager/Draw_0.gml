// ==========================================
// DRAW TABLE BACKGROUND
// ==========================================

draw_sprite_stretched(
    sTable,
    0,
    0,
    0,
    room_width,
    room_height
);


// ==========================================
// FADE TO BLACK
// ==========================================

if (scene_ending)
{
    draw_set_color(c_black);
    draw_set_alpha(end_fade_alpha);

    draw_rectangle(
        0,
        0,
        display_get_gui_width(),
        display_get_gui_height(),
        false
    );

    draw_set_alpha(1);
    draw_set_color(c_white);
}