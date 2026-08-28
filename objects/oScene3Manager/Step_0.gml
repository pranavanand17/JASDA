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
// FADE FROM BLACK
// ==========================================

if (fade_alpha > 0)
{
    fade_alpha -= fade_speed;

    if (fade_alpha < 0)
    {
        fade_alpha = 0;
        scene_started = true;
    }
}


// ==========================================
// INTRO SHOT
// ==========================================

if (
    scene_started &&
    scene_state == "intro"
)
{
    intro_timer--;

    if (intro_timer <= 0)
    {
        scene_state = "fade_to_class";

        transition_active = true;
        transition_direction = "fade_out";
        transition_alpha = 0;
    }
}


// ==========================================
// TRANSITIONS
// ==========================================

if (transition_active)
{
    // ======================================
    // FADE OUT
    // ======================================

    if (transition_direction == "fade_out")
    {
        transition_alpha += 0.03;

        if (transition_alpha >= 1)
        {
            transition_alpha = 1;

            current_background = sClassroom_front;

            character_manager.show_character(
                character_manager.ariel,
                "center"
            );

            character_manager.set_active_character(
                "Ariel"
            );

            dialogue_stage = "hello";
            scene_state = "classroom";

            transition_direction = "fade_in";
        }
    }


    // ======================================
    // FADE TO CLOCK
    // ======================================

    else if (transition_direction == "to_clock")
    {
        transition_alpha += 0.03;

        if (transition_alpha >= 1)
        {
            transition_alpha = 1;

            // Stay black for 2 seconds
            black_timer = room_speed * 2;

            transition_direction = "wait_black";
        }
    }


    // ======================================
    // HOLD BLACK
    // ======================================

    else if (transition_direction == "wait_black")
    {
        black_timer--;

        if (black_timer <= 0)
        {
            current_background = sClock;

            clock_active = true;
            clock_frame = 0;

            clock_timer = ceil(
                audio_sound_length(
                    snd_school_bell
                ) * room_speed
            );

            audio_play_sound(
                snd_school_bell,
                1,
                false
            );

            transition_direction = "fade_in";
        }
    }


    // ======================================
    // FADE IN
    // ======================================

    else if (transition_direction == "fade_in")
    {
        transition_alpha -= 0.03;

        if (transition_alpha <= 0)
        {
            transition_alpha = 0;

            transition_active = false;

            if (
                scene_state == "classroom" &&
                !dialogue_started
            )
            {
                dialogue_started = true;

                vn_controller.start_dialogue(
                    "Ariel",
                    "Hello everyone, so nice to meet you all!"
                );
            }
        }
    }


    // ======================================
    // FINAL FADE
    // ======================================

    else if (transition_direction == "scene_end")
    {
        transition_alpha += 0.03;

        if (transition_alpha >= 1)
        {
            transition_alpha = 1;

            // Scene 4 later
        }
    }
}


// ==========================================
// CLOCK
// ==========================================

if (clock_active)
{
    clock_timer--;

    // Change frame after 1 second
    if (
        clock_timer ==
        ceil(audio_sound_length(snd_school_bell) * room_speed)
        - room_speed
    )
    {
        clock_frame = 1;
    }


    // ======================================
    // BELL FINISHED
    // ======================================

    if (clock_timer <= 0)
    {
        clock_active = false;

        transition_active = true;
        transition_direction = "scene_end";
        transition_alpha = 0;

        room_goto(rm_scene4);
    }
}