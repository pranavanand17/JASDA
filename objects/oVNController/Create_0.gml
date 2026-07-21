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
    speaker = _speaker;
    dialogue = _text;

    display_text = "";
    text_index = 0;

    line_finished = false;

    dialogue_active = false;

    dialogue_pending = true;
    dialogue_delay_timer = dialogue_delay;
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

dialogue_delay = 2 * room_speed;
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

    dialogue_active = false;
}

scene_manager = noone;
