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
}


// ==========================================
// START DIALOGUE
// ==========================================

if (
    scene_started &&
    !dialogue_started
)
{
    dialogue_started = true;

    dialogue_stage = "anonymous_greeting";

    vn_controller.start_dialogue(
        "Anonymous",
        "Hey {MC}"
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
        // ANONYMOUS - HEY MC
        // ==================================

        case "anonymous_greeting":

            dialogue_stage = "jasda_apology";

            // --------------------------------
            // JASDA APPEARS
            // --------------------------------

            character_manager.show_character(
                character_manager.jasda,
                "center"
            );

            character_manager.set_active_character(
                "Jasda"
            );

            character_manager.change_expression(
                character_manager.jasda,
                "default"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Sorry to bother you."
            );

        break;


        // ==================================
        // JASDA - SORRY TO BOTHER YOU
        // ==================================

        case "jasda_apology":

            dialogue_stage = "mc_wassup";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "No no it's alright. Wassup?"
            );

        break;


        // ==================================
        // MC - WASSUP
        // ==================================

        case "mc_wassup":

            dialogue_stage = "jasda_extracurriculars";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "You said you would show me around school...\nI was wondering where I would go for extracurriculars."
            );

        break;


        // ==================================
        // JASDA - EXTRACURRICULARS
        // ==================================

        case "jasda_extracurriculars":

            dialogue_stage = "mc_forgot";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Oh I'm so sorry I completely forgot."
            );

        break;


        // ==================================
        // MC - I FORGOT
        // ==================================

        case "mc_forgot":

            dialogue_stage = "jasda_someone_else";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "No it's okay, I could ask someone else if you're busy."
            );

        break;


        // ==================================
        // JASDA - ASK SOMEONE ELSE
        // ==================================

        case "jasda_someone_else":

            dialogue_stage = "mc_show_around";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "No no, I would love to show you around."
            );

        break;


        // ==================================
        // MC - SHOW YOU AROUND
        // ==================================

        case "mc_show_around":

            dialogue_stage = "jasda_great";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "That's great!"
            );

        break;


        // ==================================
        // JASDA - THAT'S GREAT
        // ==================================

        case "jasda_great":

            dialogue_stage = "mc_clubroom";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Come this way to the club room..."
            );

        break;


        // ==================================
        // MC - CLUB ROOM
        // ==================================

        case "mc_clubroom":

            character_manager.hide_character(
                "Jasda"
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