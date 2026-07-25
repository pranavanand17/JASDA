if (!active)
{
    exit;
}


for (var i = 0; i < choice_count; i++)
{
    var y_pos = choice_y + i * (choice_height + choice_spacing);


    if (mouse_x >= choice_x &&
        mouse_x <= choice_x + choice_width &&
        mouse_y >= y_pos &&
        mouse_y <= y_pos + choice_height)
    {
        selected_choice = i;


        if (mouse_check_button_pressed(mb_left))
        {
            active = false;


            if (callback != noone)
            {
                callback(i);
            }
        }
    }
}