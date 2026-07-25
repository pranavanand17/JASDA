// ==========================================
// CHOICE SYSTEM
// ==========================================

active = false;

options = [];

choice_count = 0;

selected_choice = -1;


// Position

choice_x = 200;
choice_y = 680;

choice_width = 1200;
choice_height = 80;

choice_spacing = 20;


// Callback

callback = noone;

start_choice = function(_options, _callback)
{
    options = _options;

    choice_count = array_length(options);

    callback = _callback;

    selected_choice = -1;

    active = true;
}

end_choice = function()
{
    active = false;

    options = [];

    callback = noone;
}