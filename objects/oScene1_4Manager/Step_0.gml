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
// FADE INTO ENTRANCE
// ==========================================

if (scene_state == 0)
{
    fade_alpha -= fade_speed;

    if (fade_alpha <= 0)
    {
        fade_alpha = 0;

        scene_state = 1;
    }
}


// ==========================================
// START FIRST DIALOGUE
// ==========================================

if (
    scene_state == 1 &&
    !dialogue_started &&
    vn_controller != noone
)
{
    dialogue_started = true;

    vn_controller.start_dialogue(
        "Amber",
        "Seriously? On the first fucking day?"
    );
}


// ==========================================
// FADE TO BLACK
// ==========================================

if (scene_state == 6)
{
    end_fade_alpha += end_fade_speed;

    if (end_fade_alpha >= 1)
    {
        end_fade_alpha = 1;

        scene_state = 7;

        room_goto(rm_scene2);
    }
}