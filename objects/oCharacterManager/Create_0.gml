// ==========================================
// CHARACTER SLOTS
// ==========================================

characters =
{
    left: noone,
    center: noone,
    right: noone
};


// ==========================================
// POSITIONS
// ==========================================

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


// ==========================================
// CREATE CHARACTER
// ==========================================

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

        // ==========================================
        // SCALE
        // ==========================================

        base_scale: 1.5,
        scale: 1.5,

        alpha: 1,

        fading_out: false,
        fading_in: false,

        fade_speed: 0.03
    };
}


// ==========================================
// EXPRESSIONS
// ==========================================

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
        default: sFelix_Idle
    },

    Ariel:
    {
        default: sAriel_Idle,
        smoking: sAriel_smoking
    }
};


// ==========================================
// CHANGE EXPRESSION
// ==========================================

function change_expression(_character, _expression)
{
    var data = expressions[$ _character.name];

    if (data != undefined)
    {
        if (data[$ _expression] != undefined)
        {
            _character.sprite = data[$ _expression];
            _character.expression = _expression;
        }
    }
}


// ==========================================
// CREATE CHARACTERS
// ==========================================

jasda = create_character(
    "Jasda",
    sJasda_Idle
);

amber = create_character(
    "Amber",
    sAmber_Idle
);

felix = create_character(
    "Felix",
    sFelix_Idle
);

ariel = create_character(
    "Ariel",
    sAriel_Idle
);


// ==========================================
// CHARACTER DATABASE
// ==========================================

character_database =
{
    Jasda: jasda,
    Amber: amber,
    Felix: felix,
    Ariel: ariel
};


// ==========================================
// GET CHARACTER
// ==========================================

function get_character(_name)
{
    if (variable_struct_exists(character_database, _name))
    {
        return character_database[$ _name];
    }

    return noone;
}


// ==========================================
// SHOW CHARACTER
// ==========================================

show_character = function(_character, _slot)
{
    _character.visible = true;

    _character.x = positions[$ _slot].x;
    _character.y = positions[$ _slot].y;

    // ==========================================
    // CHARACTER OFFSETS
    // ==========================================

    if (_character.name == "Ariel")
    {
        _character.y += 480;
    }

    // Reset scale when character appears
    _character.scale = _character.base_scale;

    _character.alpha = 0;

    _character.fading_out = false;
    _character.fading_in = true;

    characters[$ _slot] = _character;
};


// ==========================================
// HIDE CHARACTER
// ==========================================

hide_character = function(_name)
{
    var slots =
    [
        "left",
        "center",
        "right"
    ];

    for (var i = 0; i < array_length(slots); i++)
    {
        var slot = slots[i];

        var char = characters[$ slot];

        if (char != noone)
        {
            if (char.name == _name)
            {
                char.fading_out = true;
            }
        }
    }
};


// ==========================================
// INITIAL STATE
// ==========================================

alarm[0] = room_speed * 3;

active_character = "";

set_active_character("Jasda");

change_expression(
    jasda,
    "default"
);


// ==========================================
// ACTIVE SPEAKER
// ==========================================

function set_active_character(_name)
{
    active_character = _name;
}


// ==========================================
// DEBUG
// ==========================================

show_debug_message(jasda.name);
show_debug_message(amber.name);
show_debug_message(felix.name);
show_debug_message(ariel.name);