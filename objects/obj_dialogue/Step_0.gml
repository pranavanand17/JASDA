// TALKING STATE
if (state == "talking")
{
    // Typewriter effect
    if (char_index < string_length(dialogue[dialogue_index]))
    {
        char_index += text_speed;
        current_text = string_copy(dialogue[dialogue_index], 1, char_index);
    }
    else
    {
        // Line finished typing
        if (keyboard_check_pressed(vk_space))
        {
            // If last line, go to choice
            if (dialogue_index == 2)
            {
                state = "choice";
            }
            else
            {
                dialogue_index++;
                char_index = 0;
            }
        }
    }
}

// CHOICE STATE
if (state == "choice")
{
    if (keyboard_check_pressed(ord("1")))
    {
        affection += 5;
        dialogue = ["Oh… that’s kind of sweet."];
        dialogue_index = 0;
        char_index = 0;
        state = "talking";
    }

    if (keyboard_check_pressed(ord("2")))
    {
        affection -= 5;
        dialogue = ["H-Hey! That was rude!"];
        dialogue_index = 0;
        char_index = 0;
        state = "talking";
    }
}