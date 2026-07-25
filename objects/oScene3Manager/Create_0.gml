// ==========================================
// SCENE 3 MANAGER
// ==========================================


// ==========================================
// FIND MANAGERS
// ==========================================

vn_controller = instance_find(oVNController, 0);
character_manager = instance_find(oCharacterManager, 0);


// ==========================================
// SCENE STATE
// ==========================================

scene_stage = "fade_in";


// ==========================================
// BACKGROUND
// ==========================================

// First-person view from MC's seat
current_background = sClassroom_LastBench;


// ==========================================
// FADE
// ==========================================

fade_alpha = 1;
fade_speed = 0.03;
fade_active = true;


// ==========================================
// SCENE START
// ==========================================

scene_started = false;


// ==========================================
// DIALOGUE
// ==========================================

dialogue_started = false;


// ==========================================
// TRANSITION
// ==========================================

transition_active = false;
transition_alpha = 0;
transition_state = 0;


// ==========================================
// END FADE
// ==========================================

end_fade = false;
end_fade_alpha = 0;
end_fade_state = 0;