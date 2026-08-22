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
    // SHOW FELIX
    // --------------------------------------

    character_manager.show_character(
        character_manager.felix,
        "center"
    );

    character_manager.set_active_character(
        "Felix"
    );

    character_manager.change_expression(
        character_manager.felix,
        "excited"
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
        "Felix",
        "I'm telling you dude Rem is best girl.\nEmelia is so full of shit."
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
        // FELIX - REM VS EMELIA
        // ==================================

        case "intro":

            dialogue_stage = "mc_extracurriculars";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Why do we even come to extracurriculars anyway?\nWe could have just stayed in class and talked about anime."
            );

        break;


        // ==================================
        // MC - EXTRACURRICULARS
        // ==================================

        case "mc_extracurriculars":

            dialogue_stage = "felix_dont_know";

            character_manager.set_active_character(
                "Felix"
            );

            character_manager.change_expression(
                character_manager.felix,
                "default"
            );

            vn_controller.start_dialogue(
                "Felix",
                "I don't know dude."
            );

        break;


        // ==================================
        // FELIX - DON'T KNOW
        // ==================================

        case "felix_dont_know":

            dialogue_stage = "mc_heading_home";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Yeah yeah I feel ya, you heading home after this?"
            );

        break;


        // ==================================
        // MC - HEADING HOME
        // ==================================

        case "mc_heading_home":

            dialogue_stage = "felix_fear_hunger";

            character_manager.set_active_character(
                "Felix"
            );

            character_manager.change_expression(
                character_manager.felix,
                "excited"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Yeah, I just downloaded Fear & Hunger.\nI can't wait to get home & start playing it."
            );

        break;


        // ==================================
        // FELIX - FEAR & HUNGER
        // ==================================

        case "felix_fear_hunger":

            dialogue_stage = "amber_greeting";

            // --------------------------------
            // AMBER WALKS IN
            // --------------------------------

            character_manager.show_character(
                character_manager.amber,
                "right"
            );

            character_manager.set_active_character(
                "Amber"
            );

            character_manager.change_expression(
                character_manager.amber,
                "default"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Hey dork!"
            );

        break;


        // ==================================
        // AMBER - HEY DORK
        // ==================================

        case "amber_greeting":

            dialogue_stage = "mc_amber";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "What do you want Amber?"
            );

        break;


        // ==================================
        // MC - WHAT DO YOU WANT
        // ==================================

        case "mc_amber":

            dialogue_stage = "amber_done";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "I'm done with my work, let's get going."
            );

        break;


        // ==================================
        // AMBER - LET'S GO
        // ==================================

        case "amber_done":

            dialogue_stage = "felix_psst";

            character_manager.set_active_character(
                "Felix"
            );

            character_manager.change_expression(
                character_manager.felix,
                "shy"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Dude...\nPsst.."
            );

        break;


        // ==================================
        // FELIX - PSST
        // ==================================

        case "felix_psst":

            dialogue_stage = "mc_what";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "What?"
            );

        break;


        // ==================================
        // MC - WHAT
        // ==================================

        case "mc_what":

            dialogue_stage = "felix_ask";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Ask her..."
            );

        break;


        // ==================================
        // FELIX - ASK HER
        // ==================================

        case "felix_ask":

            dialogue_stage = "mc_asks_amber";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Oh? Amber...\nFelix was wondering if he could walk to school with us?"
            );

        break;


        // ==================================
        // MC - ASKS AMBER
        // ==================================

        case "mc_asks_amber":

            dialogue_stage = "amber_rejects";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Oh...\nI'm sorry but... I'm already late to class as it is waiting for you...\nI don't know if I could wait for someone else.\nSorry."
            );

        break;


        // ==================================
        // AMBER - REJECTS
        // ==================================

        case "amber_rejects":

            dialogue_stage = "felix_embarrassed";

            character_manager.set_active_character(
                "Felix"
            );

            character_manager.change_expression(
                character_manager.felix,
                "embarrassed"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Nah, it's all good.\nI wasn't really all that interested in coming anyway... he he"
            );

        break;


        // ==================================
        // FELIX - FAKE LAUGH
        // ==================================

        case "felix_embarrassed":

            dialogue_stage = "felix_leaves";

            vn_controller.start_dialogue(
                "Felix",
                "My mom forced me to ask you guys...\n...\nOk, bye I gotta go now."
            );

        break;


        // ==================================
        // FELIX LEAVES
        // ==================================

        case "felix_leaves":

            dialogue_stage = "amber_weird";

            character_manager.hide_character(
                "Felix"
            );

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Okaaaay...\nThat was weird.\nYou ready to head home?"
            );

        break;


        // ==================================
        // AMBER - THAT WAS WEIRD
        // ==================================

        case "amber_weird":

            dialogue_stage = "final";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Sure, let's go."
            );

        break;


        // ==================================
        // SCENE COMPLETE
        // ==================================

        case "final":

            character_manager.hide_character(
                "Amber"
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

        // Scene 8 goes here later.
        // Keep the screen black.
    }
}