// ==========================================
// DRAW CHARACTERS
// ==========================================

var slots = ["left", "center", "right"];

for (var i = 0; i < array_length(slots); i++)
{
    var slot = slots[i];

    var char = characters[$ slot];

    if (char != noone && char.visible)
    {
        // ==========================================
        // FADE IN
        // ==========================================

        if (char.fading_in)
        {
            char.alpha += char.fade_speed;

            if (char.alpha >= 1)
            {
                char.alpha = 1;
                char.fading_in = false;
            }
        }


        // ==========================================
        // FADE OUT
        // ==========================================

        if (char.fading_out)
        {
            char.alpha -= char.fade_speed;

            if (char.alpha <= 0)
            {
                char.alpha = 0;

                char.visible = false;
                char.fading_out = false;

                characters[$ slot] = noone;

                continue;
            }
        }


        // ==========================================
        // ACTIVE CHARACTER HIGHLIGHT
        // ==========================================

        if (!char.fading_in && !char.fading_out)
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


        // ==========================================
        // DRAW CHARACTER
        // ==========================================

        if (char.sprite != noone)
        {
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