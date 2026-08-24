// Add newly typed characters
if (string_length(keyboard_string) > 0)
{
    if (string_length(input_text) < max_length)
    {
        input_text += keyboard_string;
    }

    keyboard_string = "";
}

// Backspace
if (keyboard_check_pressed(vk_backspace))
{
    if (string_length(input_text) > 0)
    {
        input_text = string_delete(
            input_text,
            string_length(input_text),
            1
        );
    }
}

// Cursor blink
cursor_timer++;

if (cursor_timer >= 30)
{
    cursor_timer = 0;
    cursor_show = !cursor_show;
}

// Confirm
if (keyboard_check_pressed(vk_enter))
{
    if (string_length(input_text) > 0)
    {
        global.player_name = input_text;

        room_goto(rm_scene20);
    }
}