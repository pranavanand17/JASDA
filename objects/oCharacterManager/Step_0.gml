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
// SMOOTH POSITION MOVEMENT
// ==========================================

char.x = lerp(
    char.x,
    char.target_x,
    0.08
);
        // ==========================================
        // GET CHARACTER EXPRESSIONS
        // ==========================================

        if (!variable_struct_exists(
            expressions,
            char.name
        ))
        {
            continue;
        }

        var expression_data =
            expressions[$ char.name];


        // ==========================================
        // CHECK CURRENT EXPRESSION
        // ==========================================

        if (!variable_struct_exists(
            expression_data,
            char.expression
        ))
        {
            char.expression = "default";
        }


        var current_expression =
            expression_data[$ char.expression];


        // ==========================================
        // GET NORMAL SCALE
        // ==========================================

        var normal_scale =
            current_expression.scale;


        // ==========================================
        // NO CHARACTER SHRINKING
        // ==========================================

        char.target_scale = normal_scale;


        // ==========================================
        // SMOOTH SCALE
        // ==========================================

        char.scale = lerp(
            char.scale,
            char.target_scale,
            0.15
        );
    }
}