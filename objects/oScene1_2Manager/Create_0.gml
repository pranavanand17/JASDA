// ==========================================
// DOOR SCENE STATE
// ==========================================

// 1 = fade into Door 1
// 2 = hold Door 1
// 3 = transition to Door 2
// 4 = hold Door 2
// 5 = transition to Door 3
// 6 = hold Door 3
// 7 = fade to black

door_state = 1;


// ==========================================
// CURRENT BACKGROUND
// ==========================================

current_background = sDoorClose1;


// ==========================================
// FADE
// ==========================================

door_fade_alpha = 1;

door_fade_speed = 0.05;


// ==========================================
// TIMERS
// ==========================================

door_timer = 0;


// ==========================================
// HOLD TIMES
// ==========================================

door_hold_time = room_speed * 2.5;

final_hold_time = room_speed * 3;