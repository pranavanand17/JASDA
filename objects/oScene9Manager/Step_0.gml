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

    // ==========================================
    // PREPARE ARIEL
    // ==========================================

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
// FADE TO BLACK
// ==========================================

if (transition_active)
{
    transition_alpha += fade_speed;

    if (transition_alpha >= 1)
    {
        transition_alpha = 1;

        // ==========================================
        // NEXT SCENE
        // ==========================================

        // Put the next room here when ready.
        // room_goto(rm_scene10);

        // Keep screen black for now.
    }
}