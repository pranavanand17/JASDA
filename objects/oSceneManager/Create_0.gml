char_manager = instance_find(oCharacterManager,0);
current_scene = noone;
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

function load_scene(_scene)
{
    current_scene = _scene;

    event_index = 0;
    event_wait = 0;
    events_running = true;
}

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
        var character = char_manager.get_character(event.character);

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
        char_manager.hide_character(event.character);
    }


    event_wait = event.wait;


    event_index++;
}
loaded = false;
event_index = 0;
event_wait = 0;
events_running = false;
alarm_clicked = false;
alarm_timer = 0;
calendar_shown = false;
scene_fade = false;
scene_fade_alpha = 0;
scene_fade_state = 0;