char_manager = instance_find(oCharacterManager,0);
current_scene = noone;
test_scene =
{
    background: spr_classroom,

    events:
	[
		{
		    action:"show",
		    character:"Jasda",
		    position:"left",
		    wait:60
		},

		{
		    action:"show",
		    character:"Amber",
		    position:"right",
		    wait:60
		},

		{
		    action:"hide",
		    character:"Amber",
		    wait:60
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
