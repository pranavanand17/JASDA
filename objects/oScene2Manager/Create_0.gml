// ==========================================
// SCENE 2
// ==========================================


// ==========================================
// FIND MANAGERS
// ==========================================

vn_controller = instance_find(
    oVNController,
    0
);

character_manager = instance_find(
    oCharacterManager,
    0
);

choice_controller = instance_find(
    oChoiceController,
    0
);


// ==========================================
// CONNECT VN CONTROLLER
// ==========================================

if (vn_controller != noone)
{
    vn_controller.scene_manager = id;
}


// ==========================================
// BACKGROUND
// ==========================================

current_background = sCourtyard;


// ==========================================
// FADE IN
// ==========================================

fade_alpha = 1;
fade_speed = 0.03;


// ==========================================
// SCENE STATE
// ==========================================

scene_started = false;
dialogue_started = false;

dialogue_stage = "intro";


// ==========================================
// TRANSITION
// ==========================================

transition_active = false;
transition_alpha = 0;
transition_speed = 0.03;


// ==========================================
// AMBER FADE
// ==========================================

amber_leaving = false;
amber_fade_timer = 0;


// ==========================================
// START AMBER CHOICE
// ==========================================

function start_amber_choice()
{
    choice_controller.start_choice(
        [
            "Thank you",
            "Why should I be thankful?",
            "Yeah whatever",
            "..."
        ],
        choice_selected
    );
}


// ==========================================
// START FELIX CHOICE
// ==========================================

function start_felix_choice()
{
    choice_controller.start_choice(
        [
            "Nah I missed it",
            "Yeah it was so cool!",
            "GTA 6?",
            "..."
        ],
        choice_selected
    );
}


// ==========================================
// CHOICE CALLBACK
// ==========================================

function choice_selected(_choice)
{
    // ======================================
    // AMBER CHOICE
    // ======================================

    if (dialogue_stage == "amber_choice")
    {
        character_manager.set_active_character("Amber");

        dialogue_stage = "amber_response";

        character_manager.change_expression(
            character_manager.amber,
            "arms_crossed"
        );

        switch (_choice)
        {
            case 0:

                vn_controller.start_dialogue(
                    "Amber",
                    "You're welcome moron"
                );

            break;


            case 1:

                vn_controller.start_dialogue(
                    "Amber",
                    "Excuse me? Do you think you're cool or something?"
                );

            break;


            case 2:

                vn_controller.start_dialogue(
                    "Amber",
                    "Don't give me attitude"
                );

            break;


            case 3:

                dialogue_stage = "amber_common_1";

                character_manager.change_expression(
                    character_manager.amber,
                    "default"
                );

                vn_controller.start_dialogue(
                    "Amber",
                    "Whatever, I don't have time for your bullshit."
                );

            break;
        }

        return;
    }


    // ======================================
    // FELIX CHOICE
    // ======================================

    if (dialogue_stage == "felix_choice")
    {
        character_manager.set_active_character("Felix");

        switch (_choice)
        {
            case 0:

                dialogue_stage = "felix_choice_response";

                vn_controller.start_dialogue(
                    "Felix",
                    "There's no way you missed it, I texted you."
                );

            break;


            case 1:

                dialogue_stage = "felix_choice_response";

                vn_controller.start_dialogue(
                    "Felix",
                    "It was so fucking cool dude."
                );

            break;


            case 2:

                dialogue_stage = "felix_choice_response";

                vn_controller.start_dialogue(
                    "Felix",
                    "Don't play dumb with me {MC}"
                );

            break;


            case 3:

                dialogue_stage = "felix_choice_response";

                vn_controller.start_dialogue(
                    "Felix",
                    "I'm pre-ordering it as soon as I can."
                );

            break;
        }

        return;
    }
}


// ==========================================
// DIALOGUE CALLBACK
// ==========================================

function dialogue_finished()
{
    // ======================================
    // INTRO
    // ======================================

    if (dialogue_stage == "intro")
    {
        dialogue_stage = "amber_choice";

        start_amber_choice();

        return;
    }


    // ======================================
    // AMBER RESPONSE
    // ======================================

    if (dialogue_stage == "amber_response")
    {
        dialogue_stage = "amber_common_1";

        character_manager.change_expression(
            character_manager.amber,
            "default"
        );

        vn_controller.start_dialogue(
            "Amber",
            "Whatever, I don't have time for your bullshit."
        );

        return;
    }


    // ======================================
    // AMBER COMMON - LINE 1 → LINE 2
    // ======================================

    if (dialogue_stage == "amber_common_1")
    {
        dialogue_stage = "amber_common_2";

        vn_controller.start_dialogue(
            "Amber",
            "I gotta go, my friends are waiting for me."
        );

        return;
    }


    // ======================================
    // AMBER COMMON - LINE 2 → ...
    // ======================================

    if (dialogue_stage == "amber_common_2")
    {
        dialogue_stage = "amber_ellipsis";

        vn_controller.start_dialogue(
            "Amber",
            "..."
        );

        return;
    }


    // ======================================
    // AMBER ...
    // ======================================

    if (dialogue_stage == "amber_ellipsis")
    {
        dialogue_stage = "amber_friends";

        vn_controller.start_dialogue(
            "Amber",
            "Oh friends? They're people who care for you and look out for you. " +
            "Not that you would know anything about that."
        );

        return;
    }


    // ======================================
    // AMBER FRIENDS → LEAVE
    // ======================================

    if (dialogue_stage == "amber_friends")
    {
        dialogue_stage = "amber_leaving";

        character_manager.hide_character(
            "Amber"
        );

        amber_leaving = true;
        amber_fade_timer = room_speed;

        return;
    }


    // ======================================
    // MC AFTER AMBER
    // ======================================

    if (dialogue_stage == "mc_after_amber")
    {
        dialogue_stage = "felix_intro";

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
            "Wassup homedawg?"
        );

        return;
    }


    // ======================================
    // FELIX INTRO
    // ======================================

    if (dialogue_stage == "felix_intro")
    {
        dialogue_stage = "felix_mc";

        character_manager.set_active_character("");

        vn_controller.start_dialogue(
            "{MC}",
            "Hey dude wassup? You're early I see... for you that is."
        );

        return;
    }


    // ======================================
    // FELIX → MOM - LINE 1
    // ======================================

    if (dialogue_stage == "felix_mc")
    {
        dialogue_stage = "felix_mom_1";

        character_manager.set_active_character(
            "Felix"
        );

        vn_controller.start_dialogue(
            "Felix",
            "Yeah mom said she doesn't care if I'm late on any other day."
        );

        return;
    }


    // ======================================
    // FELIX → MOM - LINE 2
    // ======================================

    if (dialogue_stage == "felix_mom_1")
    {
        dialogue_stage = "felix_mom_2";

        vn_controller.start_dialogue(
            "Felix",
            "But she won't let me be late on the first day."
        );

        return;
    }


    // ======================================
    // MOM → MC
    // ======================================

    if (dialogue_stage == "felix_mom_2")
    {
        dialogue_stage = "felix_mom_mc";

        character_manager.set_active_character("");

        vn_controller.start_dialogue(
            "{MC}",
            "Damn, your mom's really nice"
        );

        return;
    }


    // ======================================
    // MC → FELIX GTA - LINE 1
    // ======================================

    if (dialogue_stage == "felix_mom_mc")
    {
        dialogue_stage = "felix_gta_1";

        character_manager.set_active_character(
            "Felix"
        );

        character_manager.change_expression(
            character_manager.felix,
            "excited"
        );

        vn_controller.start_dialogue(
            "Felix",
            "Yeah she's the best."
        );

        return;
    }


    // ======================================
    // FELIX GTA - LINE 2
    // ======================================

    if (dialogue_stage == "felix_gta_1")
    {
        dialogue_stage = "felix_gta_2";

        vn_controller.start_dialogue(
            "Felix",
            "Enough 'bout my mom dude, did you see the GTA 6 trailer that dropped yesterday?"
        );

        return;
    }


    // ======================================
    // FELIX GTA → CHOICE
    // ======================================

    if (dialogue_stage == "felix_gta_2")
    {
        dialogue_stage = "felix_choice";

        start_felix_choice();

        return;
    }


    // ======================================
    // FELIX CHOICE RESPONSE
    // ======================================

    if (dialogue_stage == "felix_choice_response")
    {
        dialogue_stage = "felix_preorder";

        character_manager.set_active_character(
            "Felix"
        );

        vn_controller.start_dialogue(
            "Felix",
            "I'm pre-ordering it as soon as I can."
        );

        return;
    }


    // ======================================
    // FELIX PREORDER → FINAL MC
    // ======================================

    if (dialogue_stage == "felix_preorder")
    {
        dialogue_stage = "scene_complete";

        character_manager.set_active_character("");

        vn_controller.start_dialogue(
            "{MC}",
            "Yeah yeah, you can do that later. Let's go now... " +
            "we're about to miss attendance."
        );

        return;
    }


    // ==========================================
    // SCENE COMPLETE
    // ==========================================

    if (dialogue_stage == "scene_complete")
    {
        character_manager.hide_character(
            "Felix"
        );

        transition_active = true;
        transition_alpha = 0;

        return;
    }
}