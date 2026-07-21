if (!loaded && char_manager != noone)
{
    load_scene(scene_01_intro);
    loaded = true;
}
run_scene_events();
if (alarm_clicked && !calendar_shown)
{
    alarm_timer += 1;

    if (alarm_timer >= room_speed * 2)
    {
        calendar_shown = true;

        // Remove alarm clock
        var alarm_clock = instance_find(oAlarmClock, 0);

        if (alarm_clock != noone)
        {
            instance_destroy(alarm_clock);
        }

        // Start scene transition
        scene_fade = true;
        scene_fade_state = 1;
        scene_fade_alpha = 0;
    }
}
// ==========================================
// SCENE FADE
// ==========================================

if (scene_fade)
{
    // Fade OUT
    if (scene_fade_state == 1)
    {
        scene_fade_alpha += 0.03;

        if (scene_fade_alpha >= 1)
        {
            scene_fade_alpha = 1;

            // Change background while screen is black
            current_scene.background = sCalendar;

            // Start fading back in
            scene_fade_state = 2;
        }
    }

    // Fade IN
    else if (scene_fade_state == 2)
    {
        scene_fade_alpha -= 0.03;

        if (scene_fade_alpha <= 0)
        {
            scene_fade_alpha = 0;

            scene_fade = false;

            // NOW show dialogue
            var vn_controller = instance_find(oVNController, 0);

            if (vn_controller != noone)
            {
                vn_controller.start_dialogue(
                    "MC",
                    "Goddamnit! I forgot!"
                );
            }
        }
    }
}