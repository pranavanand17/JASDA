// Fade logo in
if (logo_alpha < 1)
{
    logo_alpha += fade_speed;
}


if (!fade_out)
{
    timer--;

    if (timer <= 0)
    {
        fade_out = true;
    }
}
else
{
    fade_alpha -= fade_speed;

    if (fade_alpha <= 0)
    {
        room_goto(rm_vn_test);
    }
}