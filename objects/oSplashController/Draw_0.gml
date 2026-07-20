// Draw logo
draw_set_alpha(logo_alpha);

draw_sprite(
    sStudioLogo,
    0,
    room_width / 3.4,
    room_height / 5
);


// Reset
draw_set_alpha(1);


// Black fade overlay
draw_set_alpha(fade_alpha);

draw_set_color(c_black);

draw_rectangle(
    0,
    0,
    room_width,
    room_height,
    false
);


draw_set_alpha(1);