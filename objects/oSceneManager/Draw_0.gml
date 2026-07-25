// ==========================================
// DRAW CURRENT BACKGROUND
// ==========================================

if (current_scene != noone)
{
    if (current_scene.background != noone)
    {
        draw_sprite(
            current_scene.background,
            0,
            0,
            0
        );
    }
}


// ==========================================
// CALENDAR FADE
// ==========================================

if (scene_fade)
{
    draw_set_color(c_black);
    draw_set_alpha(scene_fade_alpha);

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
// TABLE FADE
// ==========================================

if (table_fade)
{
    draw_set_color(c_black);
    draw_set_alpha(table_fade_alpha);

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
// NEXT BACKGROUND FADE
// ==========================================

if (next_fade)
{
    draw_set_color(c_black);
    draw_set_alpha(next_fade_alpha);

    draw_rectangle(
        0,
        0,
        display_get_gui_width(),
        display_get_gui_height(),
        false
    );

    draw_set_alpha(1);
}