// ==========================================
// CLICK BOOKS
// ==========================================

if (
    mouse_check_button_pressed(mb_left) &&
    !fading_out &&
    position_meeting(mouse_x, mouse_y, id)
)
{
    fading_out = true;
}


// ==========================================
// FADE OUT
// ==========================================

if (fading_out)
{
    image_alpha -= fade_speed;

    if (image_alpha <= 0)
    {
        image_alpha = 0;

        // --------------------------------------
        // TELL SCENE MANAGER
        // --------------------------------------

        var manager = instance_find(
            oScene1Manager,
            0
        );

        if (manager != noone)
        {
            manager.books_collected = true;
            manager.books_instance = noone;
        }

        instance_destroy();
    }
}