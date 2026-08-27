// ==========================================
// VN STATE
// ==========================================

game_started = false;


// ==========================================
// DIALOGUE STATE
// ==========================================

dialogue_active = false;

speaker = "";
dialogue = "";

display_text = "";
text_index = 0;

typing = false;
typing_speed = 20;


// ==========================================
// DIALOGUE FUNCTION
// ==========================================

function start_dialogue(_speaker, _text)
{
    // =========================
    // SET SPEAKER
    // =========================

    if (_speaker == "MC" || _speaker == "{MC}")
    {
        if (variable_global_exists("player_name"))
        {
            speaker = global.player_name;
        }
        else
        {
            speaker = "MC";
        }
    }
    else
    {
        speaker = _speaker;
    }


    // =========================
    // REPLACE MC INSIDE TEXT
    // =========================

    if (variable_global_exists("player_name"))
    {
        _text = string_replace_all(
            _text,
            "{MC}",
            global.player_name
        );
    }


    // =========================
    // START DIALOGUE
    // =========================

    dialogue = _text;

    display_text = "";
    text_index = 0;

    line_finished = false;

    // Keep the dialogue box visible
    // when changing to the next line.
    dialogue_active = true;

    typing = true;

    dialogue_pending = false;
}


// ==========================================
// DIALOGUE BOX SETTINGS
// ==========================================

box_x = 80;
box_y = 700;

box_width = 1760;
box_height = 300;

name_x = box_x + 40;
name_y = box_y + 30;

text_x = box_x + 40;
text_y = box_y + 100;


// ==========================================
// FADE
// ==========================================

fade_alpha = 1;
fade_speed = 0.005;

dialogue_delay = 1 * room_speed;
dialogue_delay_timer = 0;
dialogue_pending = false;


// ==========================================
// CHOICE SYSTEM
// ==========================================

choice_active = false;

choice_options = [];

choice_count = 0;

selected_choice = -1;

choice_x = 120;
choice_y = 780;

choice_width = 1600;
choice_height = 60;

choice_spacing = 15;

function start_choice(_options)
{
    choice_options = _options;

    choice_count = array_length(choice_options);

    choice_active = true;

    selected_choice = -1;


    // ==========================================
    // HIDE DIALOGUE BOX
    // ==========================================

    dialogue_active = false;

    dialogue = "";
    display_text = "";
    speaker = "";

    text_index = 0;
    line_finished = false;
    typing = false;
}

scene_manager = noone;


// ==========================================
// FULLSCREEN
// ==========================================

fullscreen = window_get_fullscreen();