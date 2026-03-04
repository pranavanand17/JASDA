var data = get_node(node);

// TALKING STATE
if (state == "talking")
{
    if (char_index < string_length(data.text))
    {
        char_index += text_speed;
        current_text = string_copy(data.text, 1, char_index);
    }
    else
    {
        if (keyboard_check_pressed(vk_space))
        {
            if (variable_struct_exists(data, "choices"))
            {
                state = "choice";
            }
            else if (variable_struct_exists(data, "input"))
            {
                state = "input";
            }
            else if (data.next != -1)
            {
                node = data.next;
                char_index = 0;
            }
        }
    }
}

// CHOICE STATE
if (state == "choice")
{
    for (var i = 0; i < array_length(data.choices); i++)
    {
        if (keyboard_check_pressed(ord(string(i+1))))
        {
            affection += data.choices[i].aff;
            node = data.choices[i].next;
            char_index = 0;
            state = "talking";
        }
    }
}

// INPUT STATE
if (state == "input")
{
    if (keyboard_check_pressed(vk_enter))
    {
        node = data.next;
        char_index = 0;
        player_input = "";
        state = "talking";
    }

    if (keyboard_check_pressed(vk_backspace))
    {
        if (string_length(player_input) > 0)
        {
            player_input = string_delete(player_input, string_length(player_input), 1);
        }
    }

    for (var i = 32; i <= 126; i++)
    {
        if (keyboard_check_pressed(i))
        {
            player_input += chr(i);
        }
    }
}