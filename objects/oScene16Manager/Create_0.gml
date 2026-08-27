// ==========================================
// SCENE 16
// ==========================================


// ==========================================
// FIND MANAGERS
// ==========================================

vn_controller = instance_find(
    oVNController,
    0
);

character_manager = instance_find(
    oCharacterManager,
    0
);

choice_controller = instance_find(
    oChoiceController,
    0
);


// ==========================================
// CONNECT VN CONTROLLER
// ==========================================

if (vn_controller != noone)
{
    vn_controller.scene_manager = id;
}


// ==========================================
// BACKGROUND
// ==========================================

current_background = sClubroom;


// ==========================================
// FADE
// ==========================================

fade_alpha = 1;
fade_speed = 0.03;

transition_active = false;
transition_alpha = 0;


// ==========================================
// STATE
// ==========================================

scene_started = false;
dialogue_started = false;

dialogue_stage = "intro";