// ==========================================
// DRAW BACKGROUND
// ==========================================

if (current_background != noone)
{
    draw_sprite(
        current_background,
        0,
        0,
        0
    );
}


// ==========================================
// FADE
// ==========================================

if (fade_active)
{
    draw_set_color(c_black);
    draw_set_alpha(fade_alpha);

    draw_rectangle(
        0,
        0,
        display_get_gui_width(),
        display_get_gui_height(),
        false
    );

    draw_set_alpha(1);
}