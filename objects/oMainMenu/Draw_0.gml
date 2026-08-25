// ==========================================
// BACKGROUND
// ==========================================

draw_set_color(c_black);

draw_rectangle(
    0,
    0,
    room_width,
    room_height,
    false
);


// ==========================================
// TITLE SCREEN
// ==========================================

if (menu_page == 0)
{
    draw_set_font(fnt_dialogue);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(c_white);


    // --------------------------------------
    // GAME TITLE
    // --------------------------------------

    draw_text(
        menu_x,
        title_y,
        "JASDA"
    );


    // --------------------------------------
    // START PROMPT
    // --------------------------------------

    draw_text(
        menu_x,
        room_height - 150,
        "PRESS ENTER TO BEGIN"
    );
}


// ==========================================
// MAIN MENU
// ==========================================

else
{
    draw_set_font(fnt_dialogue);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_set_color(c_white);


    // --------------------------------------
    // TITLE
    // --------------------------------------

    draw_text(
        menu_x,
        150,
        "JASDA"
    );


    // --------------------------------------
    // OPTIONS
    // --------------------------------------

    for (var i = 0; i < array_length(menu_options); i++)
    {
        y = menu_start_y + (i * menu_spacing);


        if (i == menu_selected)
        {
            draw_set_color(c_white);

            draw_text(
                menu_x,
                y,
                "> " + menu_options[i] + " <"
            );
        }
        else
        {
            draw_set_color(c_gray);

            draw_text(
                menu_x,
                y,
                menu_options[i]
            );
        }
    }
}


// ==========================================
// RESET DRAW SETTINGS
// ==========================================

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(c_white);