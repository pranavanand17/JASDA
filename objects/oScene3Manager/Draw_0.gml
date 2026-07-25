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
// FADE IN
// ==========================================

if (fade_alpha > 0)
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


// ==========================================
// TRANSITION FADE
// ==========================================

if (transition_active)
{
    draw_set_color(c_black);
    draw_set_alpha(transition_alpha);

    draw_rectangle(
        0,
        0,
        display_get_gui_width(),
        display_get_gui_height(),
        false
    );

    draw_set_alpha(1);
}