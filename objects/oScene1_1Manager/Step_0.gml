// ==========================================
// FIND VN CONTROLLER
// ==========================================

if (!instance_exists(vn_controller))
{
    vn_controller = instance_find(
        oVNController,
        0
    );
}


// ==========================================
// CREATE TABLE OBJECTS
// ==========================================

if (!table_objects_spawned)
{
    table_objects_spawned = true;


    // --------------------------------------
    // BAG
    // --------------------------------------

    bag_instance = instance_create_layer(
        300,
        500,
        "Instances",
        oBag
    );


    // --------------------------------------
    // BOOKS
    // --------------------------------------

    books_instance = instance_create_layer(
        700,
        500,
        "Instances",
        oBooks
    );


    // --------------------------------------
    // PENCIL BOX
    // --------------------------------------

    pencilbox_instance = instance_create_layer(
        1100,
        500,
        "Instances",
        oPencilBox
    );


    // --------------------------------------
    // START INVISIBLE
    // --------------------------------------

    if (instance_exists(bag_instance))
    {
        bag_instance.image_alpha = 0;
    }

    if (instance_exists(books_instance))
    {
        books_instance.image_alpha = 0;
    }

    if (instance_exists(pencilbox_instance))
    {
        pencilbox_instance.image_alpha = 0;
    }
}


// ==========================================
// FADE OBJECTS IN
// ==========================================

// BAG

if (
    instance_exists(bag_instance) &&
    !bag_collected
)
{
    bag_alpha += object_fade_speed;

    if (bag_alpha >= 1)
    {
        bag_alpha = 1;
    }

    bag_instance.image_alpha = bag_alpha;
}


// BOOKS

if (
    instance_exists(books_instance) &&
    !books_collected
)
{
    books_alpha += object_fade_speed;

    if (books_alpha >= 1)
    {
        books_alpha = 1;
    }

    books_instance.image_alpha = books_alpha;
}


// PENCIL BOX

if (
    instance_exists(pencilbox_instance) &&
    !pencilbox_collected
)
{
    pencilbox_alpha += object_fade_speed;

    if (pencilbox_alpha >= 1)
    {
        pencilbox_alpha = 1;
    }

    pencilbox_instance.image_alpha = pencilbox_alpha;
}


// ==========================================
// CLICK BAG
// ==========================================

if (
    instance_exists(bag_instance) &&
    !bag_collected &&
    mouse_check_button_pressed(mb_left)
)
{
    if (point_in_rectangle(
        mouse_x,
        mouse_y,
        bag_instance.bbox_left,
        bag_instance.bbox_top,
        bag_instance.bbox_right,
        bag_instance.bbox_bottom
    ))
    {
        bag_collected = true;
    }
}


// ==========================================
// CLICK BOOKS
// ==========================================

if (
    instance_exists(books_instance) &&
    !books_collected &&
    mouse_check_button_pressed(mb_left)
)
{
    if (point_in_rectangle(
        mouse_x,
        mouse_y,
        books_instance.bbox_left,
        books_instance.bbox_top,
        books_instance.bbox_right,
        books_instance.bbox_bottom
    ))
    {
        books_collected = true;
    }
}


// ==========================================
// CLICK PENCIL BOX
// ==========================================

if (
    instance_exists(pencilbox_instance) &&
    !pencilbox_collected &&
    mouse_check_button_pressed(mb_left)
)
{
    if (point_in_rectangle(
        mouse_x,
        mouse_y,
        pencilbox_instance.bbox_left,
        pencilbox_instance.bbox_top,
        pencilbox_instance.bbox_right,
        pencilbox_instance.bbox_bottom
    ))
    {
        pencilbox_collected = true;
    }
}


// ==========================================
// FADE BAG OUT
// ==========================================

if (
    bag_collected &&
    instance_exists(bag_instance)
)
{
    bag_alpha -= object_fade_speed;

    if (bag_alpha <= 0)
    {
        bag_alpha = 0;

        instance_destroy(bag_instance);
        bag_instance = noone;
    }
    else
    {
        bag_instance.image_alpha = bag_alpha;
    }
}


// ==========================================
// FADE BOOKS OUT
// ==========================================

if (
    books_collected &&
    instance_exists(books_instance)
)
{
    books_alpha -= object_fade_speed;

    if (books_alpha <= 0)
    {
        books_alpha = 0;

        instance_destroy(books_instance);
        books_instance = noone;
    }
    else
    {
        books_instance.image_alpha = books_alpha;
    }
}


// ==========================================
// FADE PENCIL BOX OUT
// ==========================================

if (
    pencilbox_collected &&
    instance_exists(pencilbox_instance)
)
{
    pencilbox_alpha -= object_fade_speed;

    if (pencilbox_alpha <= 0)
    {
        pencilbox_alpha = 0;

        instance_destroy(pencilbox_instance);
        pencilbox_instance = noone;
    }
    else
    {
        pencilbox_instance.image_alpha = pencilbox_alpha;
    }
}


// ==========================================
// ALL THREE COLLECTED
// ==========================================

if (
    bag_collected &&
    books_collected &&
    pencilbox_collected &&
    !dialogue_started &&
    !scene_ending
)
{
    dialogue_started = true;
    dialogue_has_been_active = false;

    if (instance_exists(vn_controller))
    {
        vn_controller.start_dialogue(
            "{MC}",
            "Amber's not gonna let me hear the end of this"
        );
    }
}


// ==========================================
// WAIT FOR DIALOGUE
// ==========================================

if (
    dialogue_started &&
    !scene_ending &&
    instance_exists(vn_controller)
)
{
    // Dialogue has actually appeared
    if (vn_controller.dialogue_active)
    {
        dialogue_has_been_active = true;
    }


    // Player closed dialogue
    if (
        dialogue_has_been_active &&
        !vn_controller.dialogue_active
    )
    {
        scene_ending = true;
        end_fade_alpha = 0;
    }
}


// ==========================================
// FADE TO BLACK
// ==========================================

if (scene_ending)
{
    end_fade_alpha += end_fade_speed;

    if (end_fade_alpha >= 1)
    {
        end_fade_alpha = 1;

        room_goto(rm_scene1_2);
    }
}