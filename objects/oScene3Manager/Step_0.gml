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
// FADE IN FROM BLACK
// ==========================================

if (fade_active)
{
    fade_alpha -= fade_speed;

    if (fade_alpha <= 0)
    {
        fade_alpha = 0;
        fade_active = false;

        scene_started = true;
    }
}


// ==========================================
// SCENE START
// ==========================================

if (
    scene_started &&
    !dialogue_started &&
    scene_stage == "fade_in"
)
{
    scene_stage = "teacher_silhouette";
}