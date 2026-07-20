// VN State

current_line = 0;

speaker = "";
dialogue = "";

typing = false;

text_speed = 2;

game_started = false;

// Test dialogue

dialogue_lines = 
[
    {
        speaker: "MC",
        text: "Oh fuck, I forgot!"
    },
    {
        speaker: "MC",
        text: "This is the beginning of JASDA."
    }
];

current_line = 0;

speaker = dialogue_lines[current_line].speaker;
dialogue = dialogue_lines[current_line].text;

display_text = "";
text_index = 0;

typing_speed = 2;

// Dialogue box settings

box_x = 80;
box_y = 700;
box_width = 1760;
box_height = 300;

name_x = box_x + 40;
name_y = box_y + 30;

text_x = box_x + 40;
text_y = box_y + 100;