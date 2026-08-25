// ==========================================
// DOOR FINAL SCENE
// ==========================================

current_background = sDoorFinal;


// ==========================================
// DOOR HANDLE
// ==========================================

door_handle = noone;


// ==========================================
// FADE
// ==========================================

door_fade = true;
door_fade_state = 1;
door_fade_alpha = 1;

door_fade_speed = 0.05;


// ==========================================
// STATE
// ==========================================

// 0 = fading into door
// 1 = waiting for handle click
// 2 = fading to classroom
// 3 = finished

door_state = 0;

// ==========================================
// DOOR SOUND
// ==========================================

doorbell_sound = audio_play_sound(
    snd_doorbell,
    1,
    true
);

door_sound_playing = false;