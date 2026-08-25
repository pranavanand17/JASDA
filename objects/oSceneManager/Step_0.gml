// ==========================================
// LOAD SCENE
// ==========================================

if (!loaded && char_manager != noone)
{
    load_scene(scene_01_intro);
    loaded = true;
}

run_scene_events();


// ==========================================
// FIND VN CONTROLLER
// ==========================================

var vn_controller = instance_find(
    oVNController,
    0
);


// ==========================================
// ALARM → CALENDAR
// ==========================================

if (alarm_clicked && !calendar_shown)
{
    alarm_timer += 1;

    if (alarm_timer >= room_speed * 2)
    {
        calendar_shown = true;

        // --------------------------------------
        // REMOVE ALARM CLOCK
        // --------------------------------------

        var alarm_clock = instance_find(
            oAlarmClock,
            0
        );

        if (alarm_clock != noone)
        {
            instance_destroy(alarm_clock);
        }

        // --------------------------------------
        // START ROOM → CALENDAR FADE
        // --------------------------------------

        scene_fade = true;
        scene_fade_state = 1;
        scene_fade_alpha = 0;
    }
}


// ==========================================
// ROOM → CALENDAR FADE
// ==========================================

if (scene_fade)
{
    // ==========================================
    // FADE OUT
    // ==========================================

    if (scene_fade_state == 1)
    {
        scene_fade_alpha += 0.03;

        if (scene_fade_alpha >= 1)
        {
            scene_fade_alpha = 1;

            // --------------------------------------
            // CHANGE TO CALENDAR
            // --------------------------------------

            current_scene.background = sCalendar;

            // --------------------------------------
            // START FADE IN
            // --------------------------------------

            scene_fade_state = 2;
        }
    }


    // ==========================================
    // FADE IN
    // ==========================================

    else if (scene_fade_state == 2)
    {
        scene_fade_alpha -= 0.03;

        if (scene_fade_alpha <= 0)
        {
            scene_fade_alpha = 0;

            scene_fade = false;
            scene_fade_state = 0;

            // --------------------------------------
            // START CALENDAR HOLD
            // --------------------------------------

            calendar_hold = true;
            calendar_hold_timer = 0;
        }
    }
}


// ==========================================
// CALENDAR HOLD
// ==========================================

if (
    calendar_hold &&
    !dialogue_started
)
{
    calendar_hold_timer += 1;

    // Hold calendar on screen for 2 seconds
    if (calendar_hold_timer >= room_speed * 2)
    {
        calendar_hold = false;

        // --------------------------------------
        // START DIALOGUE
        // --------------------------------------

        if (vn_controller != noone)
        {
            dialogue_started = true;

            vn_controller.start_dialogue(
                "{MC}",
                "Goddamnit! I forgot!"
            );
        }
    }
}


// ==========================================
// WAIT FOR DIALOGUE TO FINISH
// ==========================================

if (
    dialogue_started &&
    !scene_ending &&
    vn_controller != noone &&
    vn_controller.dialogue_active == false
)
{
    // --------------------------------------
    // DIALOGUE WAS CLOSED
    // --------------------------------------

    scene_ending = true;

    end_fade_alpha = 0;
}


// ==========================================
// FADE TO BLACK
// ==========================================

if (scene_ending)
{
    end_fade_alpha += 0.03;

    if (end_fade_alpha >= 1)
    {
        end_fade_alpha = 1;

        // --------------------------------------
        // SCENE IS FINISHED
        // --------------------------------------

        // Keep screen black.
        // Next scene/room can be triggered later.
    }
}