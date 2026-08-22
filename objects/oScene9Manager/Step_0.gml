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

    // Set Ariel's starting expression
    // (Don't show her yet)
    character_manager.set_active_character(
        "Ariel"
    );

    character_manager.change_expression(
        character_manager.ariel,
        "smoking"
    );
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

    vn_controller.start_dialogue(
        "Anonymous",
        "Back again kid?"
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
        // ANONYMOUS
        // ==================================

        case "intro":

            dialogue_stage = "ariel_how";

            // Ariel appears after Anonymous finishes
            character_manager.show_character(
                character_manager.ariel,
                "center"
            );

            character_manager.set_active_character(
                "Ariel"
            );

            character_manager.change_expression(
                character_manager.ariel,
                "smoking"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "How'd it go?"
            );

        break;


        // ==================================
        // ARIEL - HOW'D IT GO
        // ==================================

        case "ariel_how":

            dialogue_stage = "mc_how";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "How'd what go?"
            );

        break;


        // ==================================
        // MC - HOW'D WHAT GO
        // ==================================

        case "mc_how":

            dialogue_stage = "ariel_you_know";

            character_manager.set_active_character(
                "Ariel"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "You know what."
            );

        break;


        // ==================================
        // ARIEL - YOU KNOW WHAT
        // ==================================

        case "ariel_you_know":

            dialogue_stage = "mc_that";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Oh...that.\nYeah how come you made her sit next to me.\nYou tryna ship your students? That's weird if you ask me."
            );

        break;


        // ==================================
        // MC - SHIP YOUR STUDENTS
        // ==================================

        case "mc_that":

            dialogue_stage = "ariel_accusation";

            character_manager.set_active_character(
                "Ariel"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "Woah!\nDon't go accusing me of inappropriate things kid.\nI would never do that.\nI just thought I could maybe help you make a new friend is all."
            );

        break;


        // ==================================
        // ARIEL - ACCUSATION
        // ==================================

        case "ariel_accusation":

            dialogue_stage = "mc_thanks";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "...\nThanks for looking out for me"
            );

        break;


        // ==================================
        // MC - THANKS
        // ==================================

        case "mc_thanks":

            dialogue_stage = "ariel_no_worries";

            character_manager.set_active_character(
                "Ariel"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "No worries"
            );

        break;


        // ==================================
        // ARIEL - NO WORRIES
        // ==================================

        case "ariel_no_worries":

            dialogue_stage = "mc_depressed";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "...\nHey so tell me how come you're always up here smoking by yourself?\nAre you depressed?"
            );

        break;


        // ==================================
        // MC - DEPRESSED
        // ==================================

        case "mc_depressed":

            dialogue_stage = "ariel_lost";

            character_manager.set_active_character(
                "Ariel"
            );

            character_manager.change_expression(
                character_manager.ariel,
                "smoking"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "Depressed? Nope.\nLost... maybe."
            );

        break;


        // ==================================
        // ARIEL - LOST
        // ==================================

        case "ariel_lost":

            dialogue_stage = "mc_what_lost";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "What's got you lost?"
            );

        break;


        // ==================================
        // MC - WHAT'S GOT YOU LOST
        // ==================================

        case "mc_what_lost":

            dialogue_stage = "ariel_student";

            character_manager.set_active_character(
                "Ariel"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "I don't know if it's something I should be discussing with a student"
            );

        break;


        // ==================================
        // ARIEL - STUDENT
        // ==================================

        case "ariel_student":

            dialogue_stage = "mc_fair";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Hey if you can shit on me about being single\nI get to ask you about your life."
            );

        break;


        // ==================================
        // MC - FAIR
        // ==================================

        case "mc_fair":

            dialogue_stage = "ariel_guy";

            character_manager.set_active_character(
                "Ariel"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "That's fair.\nWell, it's just that I'm kinda into this guy but I'm not sure what to do about it."
            );

        break;


        // ==================================
        // ARIEL - INTO THIS GUY
        // ==================================

        case "ariel_guy":

            dialogue_stage = "mc_ask_him";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "...\nWhy don't you ask him out?"
            );

        break;


        // ==================================
        // MC - ASK HIM OUT
        // ==================================

        case "mc_ask_him":

            dialogue_stage = "ariel_inappropriate";

            character_manager.set_active_character(
                "Ariel"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "Well...\nI think asking him out might not be appropriate of me."
            );

        break;


        // ==================================
        // ARIEL - INAPPROPRIATE
        // ==================================

        case "ariel_inappropriate":

            dialogue_stage = "mc_trust_gut";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Well...\nIf you think it's inappropriate then maybe you should trust your gut."
            );

        break;


        // ==================================
        // MC - TRUST YOUR GUT
        // ==================================

        case "mc_trust_gut":

            dialogue_stage = "ariel_consider";

            character_manager.set_active_character(
                "Ariel"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "Sure kid.\nI'll take that into consideration, I guess."
            );

        break;


        // ==================================
        // ARIEL - CONSIDERATION
        // ==================================

        case "ariel_consider":

            dialogue_stage = "mc_distraught";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Don't look so distraught.\nI'm sure there's plenty of other guys who would love to go out with you."
            );

        break;


        // ==================================
        // MC - DON'T LOOK DISTRAUGHT
        // ==================================

        case "mc_distraught":

            dialogue_stage = "ariel_thanks";

            character_manager.set_active_character(
                "Ariel"
            );

            character_manager.change_expression(
                character_manager.ariel,
                "slight_smile"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "Not sure that's any way to talk to your teacher.\nBut thanks."
            );

        break;


        // ==================================
        // ARIEL - BUT THANKS
        // ==================================

        case "ariel_thanks":

            dialogue_stage = "mc_confiding";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "...\nThank you for confiding in me as well."
            );

        break;


        // ==================================
        // SCENE COMPLETE
        // ==================================

        case "mc_confiding":

            character_manager.hide_character(
                "Ariel"
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