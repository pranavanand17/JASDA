// ==========================================
// DOOR SCENE
// ==========================================

switch (door_state)
{
    // ======================================
    // FADE INTO DOOR 1
    // ======================================

    case 1:

        door_fade_alpha -= door_fade_speed;

        if (door_fade_alpha <= 0)
        {
            door_fade_alpha = 0;

            door_timer = 0;

            door_state = 2;
        }

    break;


    // ======================================
    // HOLD DOOR 1
    // ======================================

    case 2:

        door_timer++;

        if (door_timer >= door_hold_time)
        {
            door_timer = 0;

            door_fade_alpha = 0;

            door_state = 3;
        }

    break;


    // ======================================
    // FADE DOOR 1 → DOOR 2
    // ======================================

    case 3:

        door_fade_alpha += door_fade_speed;

        if (door_fade_alpha >= 1)
        {
            door_fade_alpha = 1;

            current_background = sDoorClose2;

            door_state = 4;
        }

    break;


    // ======================================
    // FADE IN DOOR 2
    // ======================================

    case 4:

        door_fade_alpha -= door_fade_speed;

        if (door_fade_alpha <= 0)
        {
            door_fade_alpha = 0;

            door_timer = 0;

            door_state = 5;
        }

    break;


    // ======================================
    // HOLD DOOR 2
    // ======================================

    case 5:

        door_timer++;

        if (door_timer >= door_hold_time)
        {
            door_timer = 0;

            door_fade_alpha = 0;

            door_state = 6;
        }

    break;


    // ======================================
    // FADE DOOR 2 → DOOR 3
    // ======================================

    case 6:

        door_fade_alpha += door_fade_speed;

        if (door_fade_alpha >= 1)
        {
            door_fade_alpha = 1;

            current_background = sDoorClose3;

            door_state = 7;
        }

    break;


    // ======================================
    // FADE IN DOOR 3
    // ======================================

    case 7:

        door_fade_alpha -= door_fade_speed;

        if (door_fade_alpha <= 0)
        {
            door_fade_alpha = 0;

            door_timer = 0;

            door_state = 8;
        }

    break;


    // ======================================
    // HOLD FINAL DOOR
    // ======================================

    case 8:

        door_timer++;

        if (door_timer >= final_hold_time)
        {
            door_fade_alpha = 0;

            door_state = 9;
        }

    break;


    // ======================================
    // FADE FINAL DOOR → BLACK
    // ======================================

    case 9:

        door_fade_alpha += door_fade_speed;

        if (door_fade_alpha >= 1)
        {
            door_fade_alpha = 1;

            // Scene finished.
            // Keep screen black for now.
        }

    break;
}