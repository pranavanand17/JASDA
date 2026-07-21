var slots = ["left", "center", "right"];

for (var i = 0; i < array_length(slots); i++)
{
    var slot = slots[i];
    var char = characters[$ slot];

    if (char != noone && char.visible)
    {
        if (char.sprite != noone)
        {
            // Don't overwrite alpha while fading out
            if (!char.fading_out)
            {
                if (char.name == active_character)
                {
                    char.alpha = 1;
                }
                else
                {
                    char.alpha = 0.5;
                }
            }

            draw_sprite_ext(
                char.sprite,
                0,
                char.x,
                char.y - char.bob_offset,
                char.scale,
                char.scale,
                0,
                c_white,
                char.alpha
            );
        }
    }
}