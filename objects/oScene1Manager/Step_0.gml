// ==========================================
// LOAD TABLE SCENE
// ==========================================

if (!loaded)
{
    current_scene = scene_table;
    loaded = true;
}


// ==========================================
// FIND VN CONTROLLER
// ==========================================

var vn_controller = instance_find(
    oVNController,
    0
);


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

    bag_instance.image_alpha = 0;
    books_instance.image_alpha = 0;
    pencilbox_instance.image_alpha = 0;
}


// ==========================================
// FADE OBJECTS IN
// ==========================================

// ------------------------------------------
// BAG
// ------------------------------------------

if (
    bag_instance != noone &&
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


// ------------------------------------------
// BOOKS
// ------------------------------------------

if (
    books_instance != noone &&
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


// ------------------------------------------
// PENCIL BOX
// ------------------------------------------

if (
    pencilbox_instance != noone &&
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
// CHECK OBJECT CLICKS
// ==========================================

// ------------------------------------------
// BAG
// ------------------------------------------

if (
    bag_instance != noone &&
    !bag_collected
)
{
    if (mouse_check_button_pressed(mb_left))
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
}


// ------------------------------------------
// BOOKS
// ------------------------------------------

if (
    books_instance != noone &&
    !books_collected
)
{
    if (mouse_check_button_pressed(mb_left))
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
}


// ------------------------------------------
// PENCIL BOX
// ------------------------------------------

if (
    pencilbox_instance != noone &&
    !pencilbox_collected
)
{
    if (mouse_check_button_pressed(mb_left))
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
}


// ==========================================
// FADE OBJECTS OUT
// ==========================================

// ------------------------------------------
// BAG
// ------------------------------------------

if (
    bag_collected &&
    bag_instance != noone
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


// ------------------------------------------
// BOOKS
// ------------------------------------------

if (
    books_collected &&
    books_instance != noone
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


// ------------------------------------------
// PENCIL BOX
// ------------------------------------------

if (
    pencilbox_collected &&
    pencilbox_instance != noone
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
// ALL OBJECTS ARE GONE
// ==========================================

if (
    bag_collected &&
    books_collected &&
    pencilbox_collected &&
    bag_instance == noone &&
    books_instance == noone &&
    pencilbox_instance == noone &&
    !table_objects_finished &&
    !scene_ending
)
{
    table_objects_finished = true;

    // --------------------------------------
    // START SHORT WAIT
    // --------------------------------------

    dialogue_delay_active = true;
    dialogue_delay_timer = 0;
}


// ==========================================
// SHORT WAIT BEFORE DIALOGUE
// ==========================================

if (
    dialogue_delay_active &&
    !table_dialogue_started
)
{
    dialogue_delay_timer += 1;

    if (dialogue_delay_timer >= room_speed)
    {
        dialogue_delay_active = false;

        table_dialogue_started = true;

        // IMPORTANT:
        // Dialogue has not actually become active yet.
        // The VN controller has its own small pending delay.

        table_dialogue_has_been_active = false;

        if (vn_controller != noone)
        {
            vn_controller.start_dialogue(
                "{MC}",
                "Amber's not gonna let me hear the end of this"
            );
        }
    }
}


// ==========================================
// WAIT FOR DIALOGUE TO ACTUALLY START
// ==========================================

if (
    table_dialogue_started &&
    !scene_ending &&
    vn_controller != noone
)
{
    // --------------------------------------
    // DIALOGUE IS NOW ACTUALLY VISIBLE
    // --------------------------------------

    if (vn_controller.dialogue_active)
    {
        table_dialogue_has_been_active = true;
    }


    // --------------------------------------
    // DIALOGUE HAS BEEN CLOSED
    // --------------------------------------

    if (
        table_dialogue_has_been_active &&
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

		room_goto(rm_scene1_2)
        // Keep screen black.
        // Next room can be added here later.
    }
}