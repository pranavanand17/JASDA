// ==========================================
// CHARACTER MANAGER
// ==========================================

char_manager = instance_find(
    oCharacterManager,
    0
);


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
    for (
        var i = 0;
        i < array_length(current_scene.characters);
        i++
    )
    {
        var data = current_scene.characters[i];

        var character = char_manager.get_character(
            data.name
        );

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


    // --------------------------------------
    // WAIT
    // --------------------------------------

    if (event_wait > 0)
    {
        event_wait--;
        return;
    }


    // --------------------------------------
    // GET EVENTS
    // --------------------------------------

    var events = current_scene.events;


    // --------------------------------------
    // ALL EVENTS FINISHED
    // --------------------------------------

    if (event_index >= array_length(events))
    {
        events_running = false;
        return;
    }


    // --------------------------------------
    // CURRENT EVENT
    // --------------------------------------

    var event = events[event_index];


    // ======================================
    // SHOW CHARACTER
    // ======================================

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


    // ======================================
    // PLAY SOUND
    // ======================================

    if (event.action == "sound")
    {
        audio_play_sound(
            event.sound,
            1,
            true
        );
    }


    // ======================================
    // HIDE CHARACTER
    // ======================================

    if (event.action == "hide")
    {
        char_manager.hide_character(
            event.character
        );
    }


    // ======================================
    // EVENT WAIT
    // ======================================

    event_wait = event.wait;


    // ======================================
    // NEXT EVENT
    // ======================================

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
// ROOM → CALENDAR TRANSITION
// ==========================================

scene_fade = false;
scene_fade_alpha = 0;
scene_fade_state = 0;


// ==========================================
// CALENDAR HOLD
// ==========================================

calendar_hold = false;
calendar_hold_timer = 0;


// ==========================================
// DIALOGUE
// ==========================================

dialogue_started = false;


// ==========================================
// END SCENE FADE
// ==========================================

scene_ending = false;
end_fade_alpha = 0;

// ==========================================
// DIALOGUE STATE
// ==========================================

dialogue_started = false;
dialogue_has_been_active = false;