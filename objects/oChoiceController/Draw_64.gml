if (active)
{
    draw_set_font(fnt_dialogue);


    for (var i = 0; i < choice_count; i++)
    {
        var y_pos = choice_y + i * (choice_height + choice_spacing);


        if (selected_choice == i)
        {
            draw_set_color(make_color_rgb(180,255,200));
        }
        else
        {
            draw_set_color(make_color_rgb(220,220,220));
        }


        draw_set_alpha(0.9);


        draw_roundrect(
            choice_x,
            y_pos,
            choice_x + choice_width,
            y_pos + choice_height,
            false
        );


        draw_set_alpha(1);
        draw_set_color(c_dkgrey);


        draw_text(
            choice_x + 25,
            y_pos + 10,
            string(i+1)+". "+options[i]
        );
    }
}