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
        // GET CURRENT EXPRESSION DATA
        // ==========================================

        var expression_data = expressions[$ char.name];

        var current_expression = expression_data[$ char.expression];

        // ==========================================
        // GET SPRITE SCALE
        // ==========================================

        var normal_scale = current_expression.scale;


        // ==========================================
        // MC IS TALKING
        // ==========================================

        if (active_character == "")
        {
            // Don't change anyone's scale.
            // MC has no character sprite.

            char.target_scale = normal_scale;
        }


        // ==========================================
        // CHARACTER IS TALKING
        // ==========================================

        else
        {
            if (char.name == active_character)
            {
                // ==========================================
                // TALKING CHARACTER
                // ==========================================

                char.target_scale = normal_scale;
            }
            else
            {
                // ==========================================
                // NON-TALKING CHARACTER
                // ==========================================

                char.target_scale = normal_scale * 0.95;
            }


            // ==========================================
            // SMOOTH SCALE CHANGE
            // ==========================================

            char.scale = lerp(
                char.scale,
                char.target_scale,
                0.15
            );
        }
    }
}