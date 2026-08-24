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

if (!scene_started)
{
    scene_started = true;

    // --------------------------------------
    // ANONYMOUS SPEAKS FIRST
    // --------------------------------------

    character_manager.set_active_character("");

    vn_controller.start_dialogue(
        "ANONYMOUS",
        "Hey dude!"
    );
}


// ==========================================
// DIALOGUE CALLBACK
// ==========================================

function dialogue_finished()
{
    switch (dialogue_stage)
    {
        // ==================================
        // ANONYMOUS - HEY DUDE
        // ==================================

        case "intro":

            dialogue_stage = "felix_gym";

            // --------------------------------
            // FELIX APPEARS
            // --------------------------------

            character_manager.show_character(
                character_manager.felix,
                "center"
            );

            character_manager.set_active_character(
                "Felix"
            );

            character_manager.change_expression(
                character_manager.felix,
                "default"
            );

            vn_controller.start_dialogue(
                "Felix",
                "It's gym time!\nLet's go!"
            );

        break;


        // ==================================
        // FELIX - IT'S GYM TIME
        // ==================================

        case "felix_gym":

            dialogue_stage = "mc_coming";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Coming, coming!"
            );

        break;


        // ==================================
        // MC - COMING
        // ==================================

        case "mc_coming":

            character_manager.hide_character(
                "Felix"
            );

            transition_active = true;
            transition_alpha = 0;

        break;
    }
}


// ==========================================
// FADE TO BLACK
// ==========================================

if (transition_active)
{
    transition_alpha += fade_speed;

    if (transition_alpha >= 1)
    {
        transition_alpha = 1;

        // Next scene goes here later.
        // Keep the screen black.
    }
}