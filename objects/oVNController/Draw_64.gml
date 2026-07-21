// Dialogue Box

if (dialogue_active)
{
    // Transparent green interior

    draw_set_color(make_color_rgb(180, 255, 200));
    draw_set_alpha(0.75);

    draw_roundrect(
        80,
        700,
        1840,
        1000,
        false
    );


    // Green outline

    draw_set_alpha(1);
    draw_set_color(make_color_rgb(180, 255, 200));

    draw_roundrect(
        80,
        700,
        1840,
        1000,
        true
    );


    // Font

    draw_set_font(fnt_dialogue);
    draw_set_color(c_dkgrey);
    draw_set_alpha(1);


    // Speaker

    draw_text(
        120,
        740,
        speaker
    );


    // Dialogue

    draw_text_ext(
        120,
        820,
        display_text,
        35,
        1600
    );
}


// Fade

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
// CHOICES
// ==========================================

if (choice_active)
{
    draw_set_font(fnt_dialogue);

    for (var i = 0; i < choice_count; i++)
    {
        var option_y = choice_y + (i * (choice_height + choice_spacing));


        // Background

        if (selected_choice == i)
        {
            draw_set_color(make_color_rgb(180, 255, 200));
        }
        else
        {
            draw_set_color(make_color_rgb(220, 220, 220));
        }

        draw_set_alpha(0.9);

        draw_roundrect(
            choice_x,
            option_y,
            choice_x + choice_width,
            option_y + choice_height,
            false
        );


        // Text

        draw_set_alpha(1);

        draw_set_color(c_dkgrey);

        draw_text(
            choice_x + 25,
            option_y + 10,
            string(i + 1) + ". " + choice_options[i]
        );
    }

    draw_set_alpha(1);
}