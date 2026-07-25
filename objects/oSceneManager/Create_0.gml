// ==========================================
// CHARACTER MANAGER
// ==========================================

char_manager = instance_find(oCharacterManager, 0);


// ==========================================
// CURRENT SCENE
// ==========================================

current_scene = noone;


// ==========================================
// SCENE 1
// ==========================================

scene_01_intro =
{
    background: spr_room,

    events:
    [
        {
            action: "sound",
            sound: snd_alarm,
            wait: 0
        }
    ]
};


// ==========================================
// LOAD SCENE
// ==========================================

function load_scene(_scene)
{
    current_scene = _scene;

    event_index = 0;
    event_wait = 0;

    events_running = true;
}


// ==========================================
// LOAD SCENE CHARACTERS
// ==========================================

function load_scene_characters()
{
    for (var i = 0; i < array_length(current_scene.characters); i++)
    {
        var data = current_scene.characters[i];

        var character = char_manager.get_character(data.name);

        if (character != noone)
        {
            char_manager.show_character(
                character,
                data.position
            );
        }
    }
}


// ==========================================
// RUN SCENE EVENTS
// ==========================================

function run_scene_events()
{
    if (!events_running)
    {
        return;
    }

    if (event_wait > 0)
    {
        event_wait--;
        return;
    }

    var events = current_scene.events;

    if (event_index >= array_length(events))
    {
        events_running = false;
        return;
    }

    var event = events[event_index];

    if (event.action == "show")
    {
        var character = char_manager.get_character(
            event.character
        );

        if (character != noone)
        {
            char_manager.show_character(
                character,
                event.position
            );
        }
    }

    if (event.action == "sound")
    {
        audio_play_sound(
            event.sound,
            1,
            true
        );
    }

    if (event.action == "hide")
    {
        char_manager.hide_character(
            event.character
        );
    }

    event_wait = event.wait;

    event_index++;
}


// ==========================================
// SCENE VARIABLES
// ==========================================

loaded = false;

event_index = 0;
event_wait = 0;
events_running = false;


// ==========================================
// ALARM
// ==========================================

alarm_clicked = false;
alarm_timer = 0;
calendar_shown = false;


// ==========================================
// CALENDAR TRANSITION
// ==========================================

scene_fade = false;
scene_fade_alpha = 0;
scene_fade_state = 0;

// ==========================================
// CALENDAR FADE
// ==========================================

scene_fade = false;
scene_fade_alpha = 0;
scene_fade_state = 0;


// ==========================================
// TABLE TRANSITION
// ==========================================

table_fade = false;
table_fade_state = 0;
table_fade_alpha = 0;

table_fade_ready = false;
table_fade_done = false;

// ==========================================
// TABLE OBJECTS
// ==========================================

table_objects_spawned = false;

bag_instance = noone;
pencilbox_instance = noone;
books_instance = noone;

bag_collected = false;
pencilbox_collected = false;
books_collected = false;

collection_dialogue_started = false;


// ==========================================
// OBJECT COLLECTION DIALOGUE
// ==========================================

collection_dialogue_started = false;


// ==========================================
// NEXT BACKGROUND FADE
// ==========================================

next_fade = false;
next_fade_state = 0;
next_fade_alpha = 0;

next_background = sTable;

