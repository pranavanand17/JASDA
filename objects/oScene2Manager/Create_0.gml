// ==========================================
// SCENE 2
// ==========================================

// Fade
fade_alpha = 1;
fade_speed = 0.005;


// Scene state
scene_started = false;
dialogue_started = false;
choice_started = false;


// Dialogue flow
dialogue_stage = "intro";


// Find managers
vn_controller = instance_find(oVNController, 0);
character_manager = instance_find(oCharacterManager, 0);


// Tell VN Controller this is the current scene controller
vn_controller.scene_manager = id;

// ==========================================
// CHOICE SELECTED
// ==========================================

function choice_selected(_choice)
{
    // ==========================================
    // AMBER CHOICE
    // ==========================================

    if (dialogue_stage == "choice")
    {
        character_manager.set_active_character("Amber");

        // Choice 1
        if (_choice == 0)
        {
            dialogue_stage = "choice_response";

            character_manager.change_expression(
                character_manager.amber,
                "arms_crossed"
            );

            vn_controller.start_dialogue(
                "Amber",
                "You're welcome moron"
            );
        }

        // Choice 2
        else if (_choice == 1)
        {
            dialogue_stage = "choice_response";

            character_manager.change_expression(
                character_manager.amber,
                "arms_crossed"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Excuse me? Do you think you're cool or something?"
            );
        }

        // Choice 3
        else if (_choice == 2)
        {
            dialogue_stage = "choice_response";

            character_manager.change_expression(
                character_manager.amber,
                "arms_crossed"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Don't give me attitude"
            );
        }

        // Choice 4
        else if (_choice == 3)
        {
            dialogue_stage = "common_dialogue";

            character_manager.change_expression(
                character_manager.amber,
                "default"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Whatever, I don't have time for your bullshit.\nI gotta go, my friends are waiting for me."
            );
        }
    }


    // ==========================================
// FELIX CHOICE
// ==========================================

else if (dialogue_stage == "felix_choice")
{
    character_manager.set_active_character("Felix");


    // ==========================================
    // CHOICE 1
    // ==========================================

    if (_choice == 0)
    {
        dialogue_stage = "felix_choice_1";

        vn_controller.start_dialogue(
            "Felix",
            "There's no way you missed it, I texted you."
        );
    }


    // ==========================================
    // CHOICE 2
    // ==========================================

    else if (_choice == 1)
    {
        dialogue_stage = "felix_choice_2";

        vn_controller.start_dialogue(
            "Felix",
            "It was so fucking cool dude."
        );
    }


    // ==========================================
    // CHOICE 3
    // ==========================================

    else if (_choice == 2)
    {
        dialogue_stage = "felix_choice_3";

        vn_controller.start_dialogue(
            "Felix",
            "Don't play dumb with me {MC's Name}"
        );
    }


    // ==========================================
    // CHOICE 4
    // ==========================================

    else if (_choice == 3)
    {
        dialogue_stage = "felix_choice_4";

        vn_controller.start_dialogue(
            "Felix",
            "I'm pre-ordering it as soon as I can."
        );
    }
}
}
// ==========================================
// FELIX CHOICE
// ==========================================

function start_felix_choice()
{
    vn_controller.start_choice([
        "Nah I missed it",
        "Yeah it was so cool!",
        "GTA 6?",
        "(...)"
    ]);
}

// ==========================================
// DIALOGUE FINISHED
// ==========================================

function dialogue_finished()
{
    // ==========================================
    // INTRO → CHOICE
    // ==========================================

    if (dialogue_stage == "intro")
    {
        dialogue_stage = "choice";

        start_scene2_choice();
    }


    // ==========================================
    // CHOICE RESPONSE → COMMON DIALOGUE
    // ==========================================

    else if (dialogue_stage == "choice_response")
    {
        dialogue_stage = "common_dialogue";

        character_manager.change_expression(
            character_manager.amber,
            "default"
        );

        vn_controller.start_dialogue(
            "Amber",
            "Whatever, I don't have time for your bullshit.\nI gotta go, my friends are waiting for me."
        );
    }


    // ==========================================
    // COMMON DIALOGUE → "..."
    // ==========================================

    else if (dialogue_stage == "common_dialogue")
    {
        dialogue_stage = "ellipsis";

        vn_controller.start_dialogue(
            "Amber",
            "..."
        );

        vn_controller.keep_dialogue_box = true;
    }


    // ==========================================
    // "..." → FRIENDS DIALOGUE
    // ==========================================

    else if (dialogue_stage == "ellipsis")
    {
        dialogue_stage = "friends_dialogue";

        vn_controller.start_dialogue(
            "Amber",
            "Oh friends? They're people who care for you and look out for you. Not that you would know anything about that."
        );
    }


    // ==========================================
    // FRIENDS DIALOGUE → AMBER LEAVES
    // ==========================================

	else if (dialogue_stage == "friends_dialogue")
	{
	    dialogue_stage = "amber_left";

	    character_manager.hide_character("Amber");
	}


    // ==========================================
    // MC → FELIX APPEARS
    // ==========================================

    else if (dialogue_stage == "mc_after_amber")
    {
        dialogue_stage = "felix_intro";

        character_manager.show_character(
            character_manager.felix,
            "center"
        );

        character_manager.set_active_character("Felix");

        character_manager.change_expression(
            character_manager.felix,
            "default"
        );

        vn_controller.start_dialogue(
            "Felix",
            "Wassup homedawg?"
        );
    }


    // ==========================================
    // FELIX → MC
    // ==========================================

    else if (dialogue_stage == "felix_intro")
    {
        dialogue_stage = "felix_mc_intro";

        character_manager.set_active_character("");

        vn_controller.start_dialogue(
            "MC",
            "Hey dude wassup? You're early I see... for you that is."
        );
    }


    // ==========================================
    // MC → FELIX
    // ==========================================

    else if (dialogue_stage == "felix_mc_intro")
    {
        dialogue_stage = "felix_mom";

        character_manager.set_active_character("Felix");

        vn_controller.start_dialogue(
            "Felix",
            "Yeah mom said she doesn't care if I'm late on any other day.\nBut she won't let me be late on the first day."
        );
    }


    // ==========================================
    // FELIX → MC
    // ==========================================

    else if (dialogue_stage == "felix_mom")
    {
        dialogue_stage = "felix_mom_mc";

        character_manager.set_active_character("");

        vn_controller.start_dialogue(
            "MC",
            "Damn, your mom's really nice"
        );
    }


    // ==========================================
    // MC → FELIX EXCITED
    // ==========================================

    else if (dialogue_stage == "felix_mom_mc")
    {
        dialogue_stage = "felix_excited";

        character_manager.set_active_character("Felix");

        character_manager.change_expression(
            character_manager.felix,
            "excited"
        );

        vn_controller.start_dialogue(
            "Felix",
            "Yeah she's the best.\nEnough 'bout my mom dude, did you see the GTA 6 trailer that dropped yesterday?"
        );
    }


    // ==========================================
    // FELIX → CHOICE
    // ==========================================

    else if (dialogue_stage == "felix_excited")
    {
        dialogue_stage = "felix_choice";

        start_felix_choice();
    }
// ==========================================
// FELIX CHOICE 1 → PREORDER
// ==========================================

else if (dialogue_stage == "felix_choice_1")
{
    dialogue_stage = "felix_preorder";

    character_manager.set_active_character("Felix");

    vn_controller.start_dialogue(
        "Felix",
        "I'm pre-ordering it as soon as I can."
    );
}


// ==========================================
// FELIX CHOICE 2 → PREORDER
// ==========================================

else if (dialogue_stage == "felix_choice_2")
{
    dialogue_stage = "felix_preorder";

    character_manager.set_active_character("Felix");

    vn_controller.start_dialogue(
        "Felix",
        "I'm pre-ordering it as soon as I can."
    );
}


// ==========================================
// FELIX CHOICE 3 → PREORDER
// ==========================================

else if (dialogue_stage == "felix_choice_3")
{
    dialogue_stage = "felix_preorder";

    character_manager.set_active_character("Felix");

    vn_controller.start_dialogue(
        "Felix",
        "I'm pre-ordering it as soon as I can."
    );
}


// ==========================================
// FELIX CHOICE 4 → FINAL MC DIALOGUE
// ==========================================

else if (dialogue_stage == "felix_choice_4")
{
    dialogue_stage = "scene_complete";

    character_manager.set_active_character("MC");

    vn_controller.start_dialogue(
        "MC",
        "Yeah yeah, you can do that later. Let's go now... we're about to miss attendance."
    );
}


// ==========================================
// PREORDER → FINAL MC DIALOGUE
// ==========================================

else if (dialogue_stage == "felix_preorder")
{
    dialogue_stage = "scene_complete";

    character_manager.set_active_character("MC");

    vn_controller.start_dialogue(
        "MC",
        "Yeah yeah, you can do that later. Let's go now... we're about to miss attendance."
    );
}


// ==========================================
// SCENE 2 COMPLETE
// ==========================================

else if (dialogue_stage == "scene_complete")
{
    // Scene 2 finished.
}
}

// ==========================================
// AMBER FADE FINISHED
// ==========================================

function amber_fade_finished()
{
    dialogue_stage = "mc_after_amber";

    character_manager.set_active_character("");

    vn_controller.start_dialogue(
        "MC",
        "Why's she gotta be so mean all the time."
    );
}