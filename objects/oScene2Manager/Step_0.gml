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

// ==========================================
// SHOW AMBER IMMEDIATELY
// ==========================================

if (!scene_started)
{
    scene_started = true;

    // Amber is already on screen while fade happens
    character_manager.show_character(
        character_manager.amber,
        "center"
    );
}

// ==========================================
// START DIALOGUE
// ==========================================

if (scene_started && !dialogue_started)
{
    dialogue_started = true;

    // Amber is currently speaking
    character_manager.set_active_character("Amber");

    // Start dialogue
    vn_controller.start_dialogue(
	    "Amber",
	    "You should be thankful I knew that shortcut otherwise we would never have got here on time",
		false
	);
}
choice_started = false;

function start_scene2_choice()
{
    if (!choice_started)
    {
        choice_started = true;

        vn_controller.start_choice([
            "Thank you",
            "Why should I be thankful?",
            "Yeah whatever",
            "..."
        ]);
    }
}

