// ==========================================
// DIALOGUE BOX + NAME BOX
// ==========================================

var choice_controller_active = false;

if (instance_exists(oChoiceController))
{
    with (oChoiceController)
    {
        if (active)
        {
            choice_controller_active = true;
        }
    }
}


if (dialogue_active &&
    !choice_active &&
    !choice_controller_active)
{
    // ==========================================
    // MAIN DIALOGUE BOX
    // ==========================================

    // Green interior

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

    draw_set_color(make_color_rgb(180, 255, 200));
    draw_set_alpha(1);

    draw_roundrect(
        80,
        700,
        1840,
        1000,
        true
    );


    // ==========================================
    // NAME BOX
    // ==========================================

    // White interior

    draw_set_color(c_white);
    draw_set_alpha(1);

    draw_roundrect(
        100,
        650,
        500,
        730,
        false
    );


    // Darker green border

    draw_set_color(make_color_rgb(90, 180, 120));
    draw_set_alpha(1);

    draw_roundrect(
        100,
        650,
        500,
        730,
        true
    );


    // ==========================================
    // FONT
    // ==========================================

    draw_set_font(fnt_dialogue);
    draw_set_color(c_dkgrey);
    draw_set_alpha(1);


// ==========================================
// SPEAKER NAME
// ==========================================

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(
    300,
    690,
    speaker
);


// Reset alignment for everything else

draw_set_halign(fa_left);
draw_set_valign(fa_top);


    // ==========================================
    // DIALOGUE TEXT
    // ==========================================

    draw_text_ext(
        120,
        820,
        display_text,
        35,
        1600
    );
}


// ==========================================
// FADE
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
// CHOICES
// ==========================================

if (choice_active)
{
    draw_set_font(fnt_dialogue);

    for (var i = 0; i < choice_count; i++)
    {
        var option_y =
            choice_y + (i * (choice_height + choice_spacing));


        // ==========================================
        // CHOICE BACKGROUND
        // ==========================================

        if (selected_choice == i)
        {
            draw_set_color(
                make_color_rgb(180, 255, 200)
            );
        }
        else
        {
            draw_set_color(
                make_color_rgb(220, 220, 220)
            );
        }

        draw_set_alpha(0.9);

        draw_roundrect(
            choice_x,
            option_y,
            choice_x + choice_width,
            option_y + choice_height,
            false
        );


        // ==========================================
        // CHOICE TEXT
        // ==========================================

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

// ==========================================
// SCENE TRANSITION FADE
// ==========================================
//
// This is intentionally drawn LAST so it
// covers the dialogue box, name box, choices,
// and everything else on the GUI.
//
// The scene manager controls the fade amount.
// ==========================================

if (instance_exists(scene_manager))
{
    // ==========================================
    // NORMAL SCENE TRANSITION
    // ==========================================

    if (variable_instance_exists(
        scene_manager,
        "transition_active"
    ))
    {
        if (scene_manager.transition_active)
        {
            draw_set_color(c_black);
            draw_set_alpha(
                scene_manager.transition_alpha
            );

            draw_rectangle(
                0,
                0,
                display_get_gui_width(),
                display_get_gui_height(),
                false
            );

            draw_set_alpha(1);
        }
    }


    // ==========================================
    // SCENE ENDING FADE
    // ==========================================

    if (variable_instance_exists(
        scene_manager,
        "scene_ending"
    ))
    {
        if (scene_manager.scene_ending)
        {
            draw_set_color(c_black);
            draw_set_alpha(
                scene_manager.end_fade_alpha
            );

            draw_rectangle(
                0,
                0,
                display_get_gui_width(),
                display_get_gui_height(),
                false
            );

            draw_set_alpha(1);
        }
    }
}