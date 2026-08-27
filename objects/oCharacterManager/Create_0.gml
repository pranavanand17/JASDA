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
        target_x: 0,

        y: 0,

        expression: "default",

        visible: false,

        // ==========================================
        // SCALE
        // ==========================================

        base_scale: 1.5,
        scale: 1.5,
        target_scale: 1.5,

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
        // 900x1058
        "default":
        {
            sprite: sJasda_New,
            scale: 1.03
        }
    },

    Amber:
    {
        // 900x1058
        "default":
        {
            sprite: sAmber_New,
            scale: 1.03
        }
    },

    Felix:
    {
        // 900x1058
        "default":
        {
            sprite: sFelix_New,
            scale: 1.03
        }
    },

    Ariel:
    {
        // 900x1058
        "default":
        {
            sprite: sAriel_New,
            scale: 1.5
        },

        // Old smoking sprite
        smoking:
        {
            sprite: sAriel_smoking,
            scale: 1.5
        }
    }
};


// ==========================================
// CHANGE EXPRESSION
// ==========================================

function change_expression(_character, _expression)
{
    // ==========================================
    // VALID CHARACTER
    // ==========================================

    if (_character == noone)
    {
        return;
    }


    // ==========================================
    // GET CHARACTER EXPRESSIONS
    // ==========================================

    if (!variable_struct_exists(
        expressions,
        _character.name
    ))
    {
        return;
    }

    var data = expressions[$ _character.name];


    // ==========================================
    // CHECK EXPRESSION
    // ==========================================

    if (!variable_struct_exists(
        data,
        _expression
    ))
    {
        // Fall back to default expression

        if (variable_struct_exists(
            data,
            "default"
        ))
        {
            _expression = "default";
        }
        else
        {
            return;
        }
    }


    // ==========================================
    // GET EXPRESSION DATA
    // ==========================================

    var expression_data =
        data[$ _expression];


    // ==========================================
    // CHANGE SPRITE
    // ==========================================

    _character.sprite =
        expression_data.sprite;


    // ==========================================
    // CHANGE SCALE
    // ==========================================

    _character.base_scale =
        expression_data.scale;

    _character.scale =
        expression_data.scale;

    _character.target_scale =
        expression_data.scale;


    // ==========================================
    // SAVE EXPRESSION
    // ==========================================

    _character.expression =
        _expression;
}


// ==========================================
// CREATE CHARACTERS
// ==========================================

jasda = create_character(
    "Jasda",
    sJasda_New
);

amber = create_character(
    "Amber",
    sAmber_New
);

felix = create_character(
    "Felix",
    sFelix_New
);

ariel = create_character(
    "Ariel",
    sAriel_New
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
    if (variable_struct_exists(
        character_database,
        _name
    ))
    {
        return character_database[$ _name];
    }

    return noone;
}


// ==========================================
// REPOSITION CHARACTERS
// ==========================================

function reposition_characters()
{
    var visible_chars = [];

    // ==========================================
    // FIND ALL VISIBLE CHARACTERS
    // ==========================================

    var slots =
    [
        "left",
        "center",
        "right"
    ];

    for (
        var i = 0;
        i < array_length(slots);
        i++
    )
    {
        var slot = slots[i];

        var char =
            characters[$ slot];

        if (
            char != noone &&
            char.visible
        )
        {
            array_push(
                visible_chars,
                char
            );
        }
    }


    // ==========================================
    // COUNT
    // ==========================================

    var count =
        array_length(visible_chars);


    // ==========================================
    // ONE CHARACTER
    // ==========================================

    if (count == 1)
    {
        visible_chars[0].target_x = 960;
    }


    // ==========================================
    // TWO CHARACTERS
    // ==========================================

    else if (count == 2)
    {
        visible_chars[0].target_x = 600;
        visible_chars[1].target_x = 1320;
    }


    // ==========================================
    // THREE CHARACTERS
    // ==========================================

    else if (count >= 3)
    {
        visible_chars[0].target_x = 300;
        visible_chars[1].target_x = 960;
        visible_chars[2].target_x = 1620;
    }
}


// ==========================================
// SHOW CHARACTER
// ==========================================

show_character = function(_character, _slot)
{
    _character.visible = true;


    // ==========================================
    // SET INITIAL X POSITION
    // ==========================================

    _character.x =
        positions[$ _slot].x;

    _character.target_x =
        _character.x;


    // ==========================================
    // SET Y POSITION
    // ==========================================

    _character.y =
        positions[$ _slot].y;


    // ==========================================
    // CHARACTER OFFSETS
    // ==========================================

    if (_character.name == "Ariel")
    {
        _character.y += 480;
    }


    // ==========================================
    // RESET SCALE
    // ==========================================

    _character.scale =
        _character.base_scale;

    _character.target_scale =
        _character.base_scale;


    // ==========================================
    // FADE IN
    // ==========================================

    _character.alpha = 0;

    _character.fading_out = false;
    _character.fading_in = true;


    // ==========================================
    // ADD CHARACTER TO SLOT
    // ==========================================

    characters[$ _slot] =
        _character;


    // ==========================================
    // REPOSITION EVERYONE
    // ==========================================

    reposition_characters();
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

    for (
        var i = 0;
        i < array_length(slots);
        i++
    )
    {
        var slot = slots[i];

        var char =
            characters[$ slot];

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

alarm[0] =
    room_speed * 3;

active_character = "";

set_active_character(
    "Jasda"
);

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

show_debug_message(
    jasda.name
);

show_debug_message(
    amber.name
);

show_debug_message(
    felix.name
);

show_debug_message(
    ariel.name
);