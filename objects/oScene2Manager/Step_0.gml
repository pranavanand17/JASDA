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
    // SHOW AMBER
    // --------------------------------------

    character_manager.show_character(
        character_manager.amber,
        "center"
    );

    character_manager.set_active_character(
        "Amber"
    );

    character_manager.change_expression(
        character_manager.amber,
        "default"
    );
}


// ==========================================
// START FIRST DIALOGUE
// ==========================================

if (
    scene_started &&
    !dialogue_started &&
    fade_alpha <= 0 &&
    vn_controller != noone
)
{
    dialogue_started = true;

    vn_controller.start_dialogue(
        "Amber",
        "You should be thankful I knew that shortcut otherwise we would never have got here on time"
    );
}


// ==========================================
// AMBER LEAVING
// ==========================================

if (amber_leaving)
{
    amber_fade_timer--;

    if (amber_fade_timer <= 0)
    {
        amber_leaving = false;

        dialogue_stage = "mc_after_amber";

        character_manager.set_active_character("");

        vn_controller.start_dialogue(
            "{MC}",
            "Why's she gotta be so mean all the time."
        );
    }
}


// ==========================================
// FINAL FADE
// ==========================================

if (transition_active)
{
    transition_alpha += transition_speed;

    if (transition_alpha >= 1)
    {
        transition_alpha = 1;

        // ==================================
        // SCENE 2 ENDS
        // ==================================

        room_goto(rm_scene3);
    }
}