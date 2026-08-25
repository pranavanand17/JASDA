// ==========================================
// DRAW CURRENT DOOR
// ==========================================

draw_sprite(
    current_background,
    0,
    0,
    0
);


// ==========================================
// FADE OVERLAY
// ==========================================

if (door_fade_alpha > 0)
{
    draw_set_color(c_black);
    draw_set_alpha(door_fade_alpha);

    draw_rectangle(
        0,
        0,
        room_width,
        room_height,
        false
    );

    draw_set_alpha(1);
    draw_set_color(c_white);
}