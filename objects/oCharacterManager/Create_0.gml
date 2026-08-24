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
        default:
        {
            sprite: sJasda_New,
            scale: 1.03
        },

		// 600x700
        new_idle:
        {
            
			sprite: sJasda_Idle,
            scale: 1.5
        }
    },

    Amber:
    {
        // 900x1058
        default:
        {
            sprite: sAmber_New,
            scale: 1.03
        },

		// 600x700
        new_idle:
        {
			sprite: sAmber_Idle,
            scale: 1.5
        }
    },

    Felix:
    {
        // 900x1058
        default:
        {
            sprite: sFelix_New,
            scale: 1.03
            
        },
        
		// 600x700
        new_idle:
        {
			sprite: sFelix_Idle,
            scale: 1.5
        }
    },

    Ariel:
    {
        // 600x700
        default:
        {
            sprite: sAriel_Idle,
            scale: 1.5
        },

        // 900x1058
        new_idle:
        {
            sprite: sAriel_New,
            scale: 0.85
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
    var data = expressions[$ _character.name];

    if (data != undefined)
    {
        var expression_data = data[$ _expression];

        if (expression_data != undefined)
        {
            // Change sprite
            _character.sprite = expression_data.sprite;

            // Change scale based on this sprite
            _character.base_scale = expression_data.scale;
            _character.scale = expression_data.scale;

            // Save expression name
            _character.expression = _expression;
        }
    }
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

    // ==========================================
    // RESET SCALE
    // ==========================================

    _character.scale = _character.base_scale;
    _character.target_scale = _character.base_scale;

    // ==========================================
    // FADE IN
    // ==========================================

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