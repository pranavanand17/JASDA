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

var slots = ["left", "center", "right"];

for (var i = 0; i < array_length(slots); i++)
{
    var slot = slots[i];
    var char = characters[$ slot];
	
	if (char != noone)
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


            // Amber finished fading
            if (char.name == "Amber")
            {
                if (instance_exists(oScene2Manager))
                {
                    var scene2 = instance_find(oScene2Manager, 0);

                    scene2.amber_fade_finished();
                }
            }
        }
    }


    // ==========================================
    // BOB
    // ==========================================

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