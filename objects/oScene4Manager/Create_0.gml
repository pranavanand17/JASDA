// ==========================================
// SCENE 4
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

vn_controller.scene_manager = id;


// ==========================================
// BACKGROUND
// ==========================================

// Temporary classroom background
current_background = spr_classroom_bg;


// ==========================================
// FADE
// ==========================================

fade_alpha = 1;
fade_speed = 0.03;


// ==========================================
// SCENE STATE
// ==========================================

scene_started = false;
dialogue_started = false;

dialogue_stage = "intro";

transition_active = false;
transition_alpha = 0;


// ==========================================
// CHOICE
// ==========================================

function choice_selected(_choice)
{
    if (dialogue_stage == "choice")
    {
        dialogue_stage = "lunch";

        character_manager.set_active_character(
            "Amber"
        );

        vn_controller.start_dialogue(
            "Amber",
            "You eating lunch by yourself again?"
        );
    }
}


function start_lunch_choice()
{
    choice_controller.start_choice(
    [
        "Hey Amber.",
        "What do you want?",
        "Who you calling dork?",
        "..."
    ],
    choice_selected
    );
}


// ==========================================
// DIALOGUE FINISHED
// ==========================================

function dialogue_finished()
{
    // ======================================
    // HEY DORK → CHOICE
    // ======================================

    if (dialogue_stage == "intro")
    {
        dialogue_stage = "choice";

        start_lunch_choice();
    }


    // ======================================
    // LUNCH
    // ======================================

    else if (dialogue_stage == "lunch")
    {
        dialogue_stage = "roof";

        character_manager.set_active_character("");

        vn_controller.start_dialogue(
            "{MC}",
            "Nah... I was gonna go eat lunch on the roof actually."
        );
    }


    // ======================================
    // ROOF
    // ======================================

    else if (dialogue_stage == "roof")
    {
        dialogue_stage = "anime";

        character_manager.set_active_character(
            "Amber"
        );

        vn_controller.start_dialogue(
            "Amber",
            "The roof? That's so lame. Do you think you're the main character of an anime or something?"
        );
    }


    // ======================================
    // ...
    // ======================================

    else if (dialogue_stage == "anime")
    {
        dialogue_stage = "ellipsis";

        vn_controller.start_dialogue(
            "Amber",
            "..."
        );
    }


    // ======================================
    // FINAL
    // ======================================

    else if (dialogue_stage == "ellipsis")
    {
        dialogue_stage = "final";

        vn_controller.start_dialogue(
            "Amber",
            "Whatever dude, do your thing I guess."
        );
    }


    // ======================================
    // END
    // ======================================

    else if (dialogue_stage == "final")
    {
        dialogue_stage = "scene_complete";

        character_manager.hide_character(
            "Amber"
        );

        transition_active = true;
        transition_alpha = 0;
    }


    // ======================================
    // COMPLETE
    // ======================================

    else if (dialogue_stage == "scene_complete")
    {
        // Scene 4 complete
    }
}