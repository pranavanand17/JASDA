// ==========================================
// FADE LOGO IN
// ==========================================

if (!fade_out)
{
    if (logo_alpha < 1)
    {
        logo_alpha += fade_speed;

        if (logo_alpha >= 1)
        {
            logo_alpha = 1;
        }
    }


    // ==========================================
    // WAIT
    // ==========================================

    if (logo_alpha >= 1)
    {
        timer--;

        if (timer <= 0)
        {
            fade_out = true;
        }
    }
}


// ==========================================
// FADE SCREEN OUT
// ==========================================

else
{
    fade_alpha += fade_speed;

    if (fade_alpha >= 1)
    {
        fade_alpha = 1;

        room_goto(rm_menu);
    }
}