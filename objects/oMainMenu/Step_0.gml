// ==========================================
// TITLE SCREEN
// ==========================================

if (menu_page == 0)
{
    if (keyboard_check_pressed(vk_enter))
    {
        menu_page = 1;
    }

    exit;
}


// ==========================================
// MAIN MENU
// ==========================================

// ------------------------------------------
// MOVE UP
// ------------------------------------------

if (keyboard_check_pressed(vk_up))
{
    menu_selected--;

    if (menu_selected < 0)
    {
        menu_selected = array_length(menu_options) - 1;
    }
}


// ------------------------------------------
// MOVE DOWN
// ------------------------------------------

if (keyboard_check_pressed(vk_down))
{
    menu_selected++;

    if (menu_selected >= array_length(menu_options))
    {
        menu_selected = 0;
    }
}


// ==========================================
// SELECT
// ==========================================

if (keyboard_check_pressed(vk_enter))
{
    switch (menu_selected)
    {
        // ----------------------------------
        // NEW GAME
        // ----------------------------------

        case 0:

            room_goto(rm_name_input);

        break;


        // ----------------------------------
        // CONTINUE
        // ----------------------------------

        case 1:

            // Nothing yet

        break;


        // ----------------------------------
        // EXTRAS
        // ----------------------------------

        case 2:

            // Nothing yet

        break;


        // ----------------------------------
        // OPTIONS
        // ----------------------------------

        case 3:

            // Nothing yet

        break;


        // ----------------------------------
        // QUIT
        // ----------------------------------

        case 4:

            game_end();

        break;
    }
}