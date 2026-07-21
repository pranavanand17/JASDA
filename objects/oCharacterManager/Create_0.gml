// Character slots

characters =
{
    left: noone,
    center: noone,
    right: noone
};


positions =
{
    left:
    {
        x: 300,
        y: 600
    },

    center:
    {
        x: 960,
        y: 600
    },

    right:
    {
        x: 1620,
        y: 600
    }
};

function create_character(_name, _sprite)
{
    return
    {
        name: _name,
        sprite: _sprite,

        x: 0,
        y: 0,

        expression: "default",

        visible: false,

        scale: 1.5,
        alpha: 1,
		visible: false,

		fading_out: false,
		fade_speed: 0.03,

        bob_offset: 0,
        bob_amount: 3,
        bob_speed: 0.008,
		fading_in: false,
		fade_speed: 0.03,
    };
}
expressions =
{
    Jasda:
    {
        default: sJasda_Idle
    },

    Amber:
    {
        default: sAmber_Idle
    },
	
	Felix:
	{
	    default: sFelix_Idle,
	}
};

function change_expression(_character, _expression)
{
    var data = expressions[$ _character.name];

    if data != undefined
    {
        if data[$ _expression] != undefined
        {
            _character.sprite = data[$ _expression];
            _character.expression = _expression;
        }
    }
}


// Test character

jasda = create_character("Jasda", sJasda_Idle);

amber = create_character("Amber", sAmber_Idle);

felix = create_character("Felix", sFelix_Idle);

character_database =
{
    Jasda: jasda,
    Amber: amber
};

function get_character(_name)
{
    if (variable_struct_exists(character_database, _name))
    {
        return character_database[$ _name];
    }

    return noone;
}

show_character = function(_character, _slot)
{
    _character.visible = true;

    _character.x = positions[$ _slot].x;
    _character.y = positions[$ _slot].y;

    // Reset fade values
    _character.alpha = 0;
    _character.fading_out = false;
    _character.fading_in = true;

    characters[$ _slot] = _character;
}

hide_character = function(_name)
{
    var slots = ["left", "center", "right"];

    for (var i = 0; i < array_length(slots); i++)
    {
        var slot = slots[i];
        var char = characters[$ slot];

        if (char != noone)
        {
            if (char.name == _name)
            {
                // Start fading instead of instantly disappearing
                char.fading_out = true;
            }
        }
    }
}
//show_character(jasda, "left");

//show_character(amber, "right");

alarm[0] = room_speed * 3;

// Currently speaking
active_character = "";
set_active_character("Jasda");
change_expression(jasda,"default");



function set_active_character(_name)
{
    active_character = _name;
}

show_debug_message(jasda.name);
show_debug_message(amber.name);