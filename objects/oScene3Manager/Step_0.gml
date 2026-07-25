// ==========================================
// FIND VN CONTROLLER
// ==========================================

if (vn_controller == noone)
{
    vn_controller = instance_find(
        oVNController,
        0
    );
}


// ==========================================
// FADE IN
// ==========================================

if (fade_alpha > 0)
{
    fade_alpha -= fade_speed;

    if (fade_alpha < 0)
    {
        fade_alpha = 0;
    }
}


// ==========================================
// START SCENE
// ==========================================

if (!scene_started && fade_alpha == 0)
{
    scene_started = true;
}


// ==========================================
// WAIT BEFORE TRANSITION
// ==========================================

if (
    scene_started &&
    dialogue_stage == "intro"
)
{
    wait_timer--;

    if (wait_timer <= 0)
    {
        dialogue_stage = "transition";

        transition_active = true;
        transition_state = 1;
        transition_alpha = 0;
    }
}


// ==========================================
// CLASSROOM TRANSITION
// ==========================================

if (transition_active)
{
    // ======================================
    // FADE OUT
    // ======================================

    if (transition_state == 1)
    {
        transition_alpha += 0.03;

        if (transition_alpha >= 1)
        {
            transition_alpha = 1;

            current_background = spr_classroom;

            character_manager.show_character(
                character_manager.ariel,
                "center"
            );

            character_manager.set_active_character(
                "Ariel"
            );

            character_manager.change_expression(
                character_manager.ariel,
                "default"
            );

            transition_state = 2;
        }
    }

    // ======================================
    // FADE IN
    // ======================================

    else if (transition_state == 2)
    {
        transition_alpha -= 0.03;

        if (transition_alpha <= 0)
        {
            transition_alpha = 0;

            transition_active = false;

            if (!dialogue_started)
            {
                dialogue_started = true;

                dialogue_stage = "hello";

                vn_controller.start_dialogue(
                    "Ariel",
                    "Hello everyone, so nice to meet you all!"
                );
            }
        }
    }


    // ======================================
    // FINAL FADE OUT
    // ======================================

    else if (transition_state == 3)
    {
        transition_alpha += 0.03;

        if (transition_alpha >= 1)
        {
            transition_alpha = 1;

        // Remove Ariel once the screen is fully black
            character_manager.hide_character("Ariel");

            transition_state = 4;
        }
    }


    // ======================================
    // SCENE COMPLETE
    // ======================================

    else if (transition_state == 4)
    {
        // Scene 3 finished.
        // Add Scene 4 here later.
    }
}