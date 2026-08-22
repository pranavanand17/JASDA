// ==========================================
// CHARACTER SCALE
// ==========================================

var slots = ["left", "center", "right"];

for (var i = 0; i < array_length(slots); i++)
{
    var slot = slots[i];

    var char = characters[$ slot];

    if (char != noone)
    {
        // ==========================================
        // MC IS TALKING
        // ==========================================

        if (active_character == "")
        {
            // Don't change anyone's scale.
            // MC has no character sprite.
        }

        // ==========================================
        // CHARACTER IS TALKING
        // ==========================================

        else
        {
            if (char.name == active_character)
            {
                char.target_scale = 1.5;
            }
            else
            {
                char.target_scale = 1.425;
            }

            // Smooth zoom
            char.scale = lerp(
                char.scale,
                char.target_scale,
                0.15
            );
        }
    }
}