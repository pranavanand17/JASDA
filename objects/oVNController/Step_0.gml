// ==========================================
// DIALOGUE DELAY
// ==========================================

if (dialogue_pending)
{
    dialogue_delay_timer--;

    if (dialogue_delay_timer <= 0)
    {
        dialogue_pending = false;
        dialogue_active = true;
        typing = true;
    }
}
// ==========================================
// DIALOGUE INPUT
// ==========================================

if (dialogue_active)
{
    if (keyboard_check_pressed(vk_space))
    {
        // If the current line is still typing,
        // instantly finish it.
        if (!line_finished)
        {
            display_text = dialogue;
            text_index = string_length(dialogue);
            line_finished = true;
        }
        else
		{
		    // Dialogue is finished.
		    dialogue_active = false;


		    // Tell the current scene controller
		    // that the dialogue has finished.

		    if (instance_exists(scene_manager))
		    {
		        scene_manager.dialogue_finished();
		    }
		}
    }


    // ==========================================
    // TYPEWRITER EFFECT
    // ==========================================

    if (text_index < string_length(dialogue))
    {
        text_index += typing_speed * delta_time / 1000000;

        display_text = string_copy(
            dialogue,
            1,
            floor(text_index)
        );

        line_finished = false;
    }
    else
    {
        line_finished = true;
    }
}


// ==========================================
// FADE
// ==========================================

if (fade_alpha > 0)
{
    fade_alpha -= fade_speed;

    if (fade_alpha < 0)
    {
        fade_alpha = 0;
    }
}

// ==========================================
// CHOICE INPUT
// ==========================================

if (choice_active)
{
    for (var i = 0; i < choice_count; i++)
    {
        var option_y = choice_y + (i * (choice_height + choice_spacing));

        if (mouse_x >= choice_x &&
            mouse_x <= choice_x + choice_width &&
            mouse_y >= option_y &&
            mouse_y <= option_y + choice_height)
        {
            selected_choice = i;

            if (mouse_check_button_pressed(mb_left))
			{
			    choice_active = false;

			    // Tell the current scene which choice was selected
			    if (instance_exists(scene_manager))
			    {
			        scene_manager.choice_selected(selected_choice);
			    }
			}
        }
    }
}