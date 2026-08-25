// ==========================================
// FIND DOOR HANDLE
// ==========================================

if (door_handle == noone)
{
    door_handle = instance_find(
        oDoorHandle,
        0
    );
}


// ==========================================
// FADE INTO DOOR
// ==========================================

if (door_state == 0)
{
    door_fade_alpha -= door_fade_speed;

    if (door_fade_alpha <= 0)
    {
        door_fade_alpha = 0;

        door_state = 1;
    }
}


// ==========================================
// WAIT FOR HANDLE CLICK
// ==========================================

if (door_state == 1)
{
    if (
        door_handle != noone &&
        mouse_check_button_pressed(mb_left)
    )
    {
        if (point_in_rectangle(
            mouse_x,
            mouse_y,
            door_handle.bbox_left,
            door_handle.bbox_top,
            door_handle.bbox_right,
            door_handle.bbox_bottom
        ))
        {
            // --------------------------------------
            // DESTROY DOOR HANDLE
            // --------------------------------------

            instance_destroy(door_handle);
            door_handle = noone;


            // --------------------------------------
            // STOP DOORBELL
            // --------------------------------------

            if (audio_is_playing(doorbell_sound))
            {
                audio_stop_sound(doorbell_sound);
            }


            // --------------------------------------
            // PLAY DOOR SOUND
            // --------------------------------------

            door_sound_playing = true;

            door_sound = audio_play_sound(
                snd_door,
                1,
                false
            );


            // --------------------------------------
            // WAIT FOR DOOR SOUND
            // --------------------------------------

            door_state = 2;
            door_fade_alpha = 0;
        }
    }
}


// ==========================================
// WAIT FOR DOOR SOUND TO FINISH
// ==========================================

if (door_state == 2)
{
    if (!audio_is_playing(door_sound))
    {
        // --------------------------------------
        // DOOR SOUND FINISHED
        // --------------------------------------

        door_sound_playing = false;

        // Start fade to black
        door_state = 3;
        door_fade_alpha = 0;
    }
}


// ==========================================
// FADE TO BLACK
// ==========================================

if (door_state == 3)
{
    door_fade_alpha += door_fade_speed;

    if (door_fade_alpha >= 1)
    {
        door_fade_alpha = 1;

        // --------------------------------------
        // SCENE FINISHED
        // --------------------------------------

        door_state = 4;
    }
}