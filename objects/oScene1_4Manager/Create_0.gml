// ==========================================
// SCENE - ENTRANCE
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


// ==========================================
// CONNECT SCENE MANAGER
// ==========================================

if (vn_controller != noone)
{
    vn_controller.scene_manager = id;
}


// ==========================================
// BACKGROUND
// ==========================================

current_background = sEntrance;


// ==========================================
// INITIAL FADE
// ==========================================

fade_alpha = 1;
fade_speed = 0.03;


// ==========================================
// SCENE STATE
// ==========================================

// 0 = fading in
// 1 = Amber's first dialogue
// 2 = choices
// 3 = Amber's response
// 4 = Amber's "..."
// 5 = Amber's final line
// 6 = fading to black
// 7 = finished

scene_state = 0;


// ==========================================
// DIALOGUE
// ==========================================

dialogue_started = false;
choice_started = false;


// ==========================================
// SCENE END
// ==========================================

scene_ending = false;

end_fade_alpha = 0;
end_fade_speed = 0.03;


// ==========================================
// SHOW AMBER
// ==========================================

if (character_manager != noone)
{
    character_manager.show_character(
        character_manager.amber,
        "center"
    );

    character_manager.set_active_character(
        "Amber"
    );
}


// ==========================================
// DIALOGUE CALLBACK
// ==========================================

function dialogue_finished()
{
    // ==========================================
    // FIRST AMBER DIALOGUE FINISHED
    // ==========================================

    if (scene_state == 1)
    {
        scene_state = 2;

        choice_started = true;

        vn_controller.start_choice(
            [
                "I'm so sorry",
                "I didn't hear the alarm",
                "As if you've never been late",
                "(...)"
            ]
        );

        return;
    }


    // ==========================================
    // AMBER RESPONSE FINISHED
    // ==========================================

    if (scene_state == 3)
    {
        scene_state = 4;

        vn_controller.start_dialogue(
            "Amber",
            "..."
        );

        return;
    }


    // ==========================================
    // "..." FINISHED
    // ==========================================

    if (scene_state == 4)
    {
        scene_state = 5;

        vn_controller.start_dialogue(
            "Amber",
            "What are you just standing there for? Let's get going."
        );

        return;
    }


    // ==========================================
    // FINAL DIALOGUE FINISHED
    // ==========================================

    if (scene_state == 5)
    {
        scene_state = 6;

        scene_ending = true;

        end_fade_alpha = 0;

        character_manager.hide_character(
            "Amber"
        );

        return;
    }
}


// ==========================================
// CHOICE CALLBACK
// ==========================================

function choice_selected(_choice)
{
    if (scene_state == 2)
    {
        choice_started = false;

        scene_state = 3;

        vn_controller.start_dialogue(
            "Amber",
            "Ok shut up, I don't wanna hear any of your lame excuses again.\n" +
            "If it weren't for my mom I wouldn't even have to walk with you to school anyway."
        );
    }
}