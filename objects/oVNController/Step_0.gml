if keyboard_check_pressed(vk_space)
{
    if line_finished == false
    {
        display_text = dialogue;
        text_index = string_length(dialogue);
    }
    else
    {
        current_line++;

        if current_line < array_length(dialogue_lines)
        {
            speaker = dialogue_lines[current_line].speaker;
            dialogue = dialogue_lines[current_line].text;

            display_text = "";
            text_index = 0;
        }
    }
}
if text_index < string_length(dialogue)
{
    text_index += typing_speed * delta_time / 1000000;
    
    display_text = string_copy(dialogue, 1, floor(text_index));

    line_finished = false;
}
else
{
    line_finished = true;
}
