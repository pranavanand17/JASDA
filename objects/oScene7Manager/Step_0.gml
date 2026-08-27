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
        "I'm telling you dude Rem is best girl."
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
        // FELIX - REM
        // ==================================

        case "intro":

            dialogue_stage = "felix_emelia";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Emelia is so full of shit."
            );

        break;


        // ==================================
        // FELIX - EMELIA
        // ==================================

        case "felix_emelia":

            dialogue_stage = "mc_extracurriculars";

            character_manager.set_active_character(
                ""
            );

            vn_controller.start_dialogue(
                "{MC}",
                "Why do we even come to extracurriculars anyway?"
            );

        break;


        // ==================================
        // MC - EXTRACURRICULARS
        // ==================================

        case "mc_extracurriculars":

            dialogue_stage = "mc_anime";

            character_manager.set_active_character(
                ""
            );

            vn_controller.start_dialogue(
                "{MC}",
                "We could have just stayed in class and talked about anime."
            );

        break;


        // ==================================
        // MC - ANIME
        // ==================================

        case "mc_anime":

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

            character_manager.set_active_character(
                ""
            );

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
                "Yeah, I just downloaded Fear & Hunger."
            );

        break;


        // ==================================
        // FELIX - FEAR & HUNGER
        // ==========================================

        case "felix_fear_hunger":

            dialogue_stage = "felix_fear_hunger_2";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "I can't wait to get home & start playing it."
            );

        break;


        // ==================================
        // FELIX - FEAR & HUNGER 2
        // ==========================================

        case "felix_fear_hunger_2":

            dialogue_stage = "amber_greeting";

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

            character_manager.set_active_character(
                ""
            );

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
                "Dude..."
            );

        break;


        // ==================================
        // FELIX - PSST
        // ==================================

        case "felix_psst":

            dialogue_stage = "felix_psst_2";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Psst.."
            );

        break;


        // ==================================
        // FELIX - PSST 2
        // ==================================

        case "felix_psst_2":

            dialogue_stage = "mc_what";

            character_manager.set_active_character(
                ""
            );

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

            character_manager.set_active_character(
                ""
            );

            vn_controller.start_dialogue(
                "{MC}",
                "Oh? Amber..."
            );

        break;


        // ==================================
        // MC - ASKS AMBER
        // ==================================

        case "mc_asks_amber":

            dialogue_stage = "mc_asks_amber_2";

            character_manager.set_active_character(
                ""
            );

            vn_controller.start_dialogue(
                "{MC}",
                "Felix was wondering if he could walk to school with us?"
            );

        break;


        // ==================================
        // MC - ASKS AMBER 2
        // ==================================

        case "mc_asks_amber_2":

            dialogue_stage = "amber_rejects";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Oh..."
            );

        break;


        // ==================================
        // AMBER - REJECTS
        // ==================================

        case "amber_rejects":

            dialogue_stage = "amber_rejects_2";

            vn_controller.start_dialogue(
                "Amber",
                "I'm sorry but... I'm already late to class as it is waiting for you..."
            );

        break;


        // ==================================
        // AMBER - REJECTS 2
        // ==================================

        case "amber_rejects_2":

            dialogue_stage = "amber_rejects_3";

            vn_controller.start_dialogue(
                "Amber",
                "I don't know if I could wait for someone else."
            );

        break;


        // ==================================
        // AMBER - REJECTS 3
        // ==================================

        case "amber_rejects_3":

            dialogue_stage = "amber_rejects_4";

            vn_controller.start_dialogue(
                "Amber",
                "Sorry."
            );

        break;


        // ==================================
        // AMBER - REJECTS 4
        // ==================================

        case "amber_rejects_4":

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
                "Nah, it's all good."
            );

        break;


        // ==================================
        // FELIX - EMBARRASSED
        // ==================================

        case "felix_embarrassed":

            dialogue_stage = "felix_embarrassed_2";

            vn_controller.start_dialogue(
                "Felix",
                "I wasn't really all that interested in coming anyway... he he"
            );

        break;


        // ==================================
        // FELIX - EMBARRASSED 2
        // ==================================

        case "felix_embarrassed_2":

            dialogue_stage = "felix_leaves";

            vn_controller.start_dialogue(
                "Felix",
                "My mom forced me to ask you guys..."
            );

        break;


        // ==================================
        // FELIX - PAUSE
        // ==================================

        case "felix_leaves":

            dialogue_stage = "felix_ellipsis";

            vn_controller.start_dialogue(
                "Felix",
                "..."
            );

        break;


        // ==================================
        // FELIX - LEAVES
        // ==================================

        case "felix_ellipsis":

            dialogue_stage = "amber_weird";

            vn_controller.start_dialogue(
                "Felix",
                "Ok, bye I gotta go now."
            );

        break;


        // ==================================
        // FELIX LEAVES
        // ==================================

        case "amber_weird":

            dialogue_stage = "amber_weird_2";

            character_manager.hide_character(
                "Felix"
            );

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Okaaaay..."
            );

        break;


        // ==================================
        // AMBER - THAT WAS WEIRD
        // ==================================

        case "amber_weird_2":

            dialogue_stage = "amber_ready";

            vn_controller.start_dialogue(
                "Amber",
                "That was weird."
            );

        break;


        // ==================================
        // AMBER - READY
        // ==================================

        case "amber_ready":

            dialogue_stage = "final";

            vn_controller.start_dialogue(
                "Amber",
                "You ready to head home?"
            );

        break;


        // ==================================
        // SCENE COMPLETE
        // ==================================

        case "final":

            dialogue_stage = "end";

            character_manager.set_active_character(
                ""
            );

            vn_controller.start_dialogue(
                "{MC}",
                "Sure, let's go."
            );

        break;


        // ==================================
        // END
        // ==================================

        case "end":

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

        // Keep the screen black.
    }
}