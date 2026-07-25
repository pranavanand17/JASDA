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

        // Remove alarm clock
        var alarm_clock = instance_find(
            oAlarmClock,
            0
        );

        if (alarm_clock != noone)
        {
            instance_destroy(alarm_clock);
        }

        // Start fade from room → calendar
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
    // --------------------------------------
    // FADE OUT
    // --------------------------------------

    if (scene_fade_state == 1)
    {
        scene_fade_alpha += 0.03;

        if (scene_fade_alpha >= 1)
        {
            scene_fade_alpha = 1;

            // Screen is completely black
            // Change background to calendar
            current_scene.background = sCalendar;

            // Start fading back in
            scene_fade_state = 2;
        }
    }


    // --------------------------------------
    // FADE IN
    // --------------------------------------

    else if (scene_fade_state == 2)
    {
        scene_fade_alpha -= 0.03;

        if (scene_fade_alpha <= 0)
        {
            scene_fade_alpha = 0;

            scene_fade = false;
            scene_fade_state = 0;

            // Start Goddamnit dialogue
            if (vn_controller != noone)
            {
                vn_controller.start_dialogue(
                    "{MC}",
                    "Goddamnit! I forgot!"
                );
            }
        }
    }
}

// ==========================================
// WAIT FOR GODDAMNIT DIALOGUE TO FINISH
// ==========================================

if (
    calendar_shown &&
    !scene_fade &&
    !table_fade &&
    !table_fade_ready &&
    !table_fade_done &&
    current_scene.background == sCalendar &&
    vn_controller != noone &&
    vn_controller.dialogue_active == false
)
{
    // Dialogue box has already been closed.
    // Now allow the player to transition to the table.
    table_fade_ready = true;
}


// ==========================================
// PRESS SPACE → CALENDAR → TABLE
// ==========================================

if (
    table_fade_ready &&
    !table_fade &&
    !table_fade_done &&
    keyboard_check_pressed(vk_space)
)
{
    table_fade_ready = false;

    table_fade = true;
    table_fade_state = 1;
    table_fade_alpha = 0;
}
// ==========================================
// FADE TO TABLE
// ==========================================

if (table_fade)
{
    // ==========================================
    // FADE OUT
    // ==========================================

    if (table_fade_state == 1)
    {
        table_fade_alpha += 0.03;

        if (table_fade_alpha >= 1)
        {
            table_fade_alpha = 1;

            // ==========================================
            // CHANGE BACKGROUND
            // ==========================================

            current_scene.background = sTable;


            // ==========================================
            // CREATE OBJECTS
            // ==========================================

            if (!table_objects_spawned)
            {
                table_objects_spawned = true;

                bag_instance = instance_create_layer(
                    300,
                    500,
                    "Instances",
                    oBag
                );

                pencilbox_instance = instance_create_layer(
                    700,
                    500,
                    "Instances",
                    oPencilBox
                );

                books_instance = instance_create_layer(
                    1100,
                    500,
                    "Instances",
                    oBooks
                );
            }


            // ==========================================
            // START FADE IN
            // ==========================================

            table_fade_state = 2;
        }
    }


    // ==========================================
    // FADE IN
    // ==========================================

    else if (table_fade_state == 2)
    {
        table_fade_alpha -= 0.03;

        if (table_fade_alpha <= 0)
        {
            table_fade_alpha = 0;

            table_fade = false;
            table_fade_state = 0;

            table_fade_done = true;
        }
    }
}

// ==========================================
// CHECK TABLE OBJECTS
// ==========================================

if (
    table_objects_spawned &&
    !collection_dialogue_started
)
{
    if (bag_instance == noone)
    {
        bag_collected = true;
    }

    if (pencilbox_instance == noone)
    {
        pencilbox_collected = true;
    }

    if (books_instance == noone)
    {
        books_collected = true;
    }


    // ==========================================
    // ALL OBJECTS COLLECTED
    // ==========================================

    if (
        bag_collected &&
        pencilbox_collected &&
        books_collected
    )
    {
        collection_dialogue_started = true;

        if (vn_controller != noone)
        {
            vn_controller.start_dialogue(
                "{MC}",
                "Amber's not gonna let me hear the end of this."
            );
        }
    }
}