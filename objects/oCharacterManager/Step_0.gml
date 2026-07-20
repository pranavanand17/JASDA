if keyboard_check_pressed(ord("C"))
{
    show_debug_message("Character Manager working!");
}
var slots = ["left", "center", "right"];

for (var i = 0; i < array_length(slots); i++)
{
    var slot = slots[i];
    var char = characters[$ slot];

    if (char != noone)
    {
        if (char.name == active_character)
        {
            char.bob_offset = sin(current_time / 150) * char.bob_amount;
        }
        else
        {
            char.bob_offset = 0;
        }
    }
}