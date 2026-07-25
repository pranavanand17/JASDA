if (fade_in)
{
    image_alpha += fade_speed;

    if (image_alpha >= 1)
    {
        image_alpha = 1;
        fade_in = false;
    }
}