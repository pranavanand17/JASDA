// ==========================================
// SCENE 3
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

if (vn_controller != noone)
{
    vn_controller.scene_manager = id;
}


// ==========================================
// BACKGROUND
// ==========================================

current_background = sClassroom_LastBench;


// ==========================================
// FADE
// ==========================================

fade_alpha = 1;
fade_speed = 0.03;


// ==========================================
// SCENE STATE
// ==========================================

scene_state = "intro";

scene_started = false;
dialogue_started = false;


// ==========================================
// TIMERS
// ==========================================

// First classroom shot
intro_timer = room_speed * 4;

// Bell duration
clock_timer = 0;

// Stay black before showing clock
black_timer = 0;


// ==========================================
// CLOCK
// ==========================================

clock_active = false;
clock_frame = 0;


// ==========================================
// DIALOGUE
// ==========================================

dialogue_stage = "";


// ==========================================
// TRANSITION
// ==========================================

transition_active = false;
transition_alpha = 0;
transition_direction = "";


// ==========================================
// DIALOGUE CALLBACK
// ==========================================

function dialogue_finished()
{
    switch(dialogue_stage)
    {
        case "hello":

            dialogue_stage = "name";

            vn_controller.start_dialogue(
                "Ariel",
                "My name's Ariel."
            );

        break;


        case "name":

            dialogue_stage = "teacher";

            vn_controller.start_dialogue(
                "Ariel",
                "I'll be your class teacher this school year."
            );

        break;


        case "teacher":

            dialogue_stage = "english";

            vn_controller.start_dialogue(
                "Ariel",
                "I'll also be teaching you English."
            );

        break;


        case "english":

            dialogue_stage = "hope";

            vn_controller.start_dialogue(
                "Ariel",
                "I hope to get along with all of you."
            );

        break;


        case "hope":

            dialogue_stage = "pause";

            vn_controller.start_dialogue(
                "Ariel",
                "..."
            );

        break;


        case "pause":

            dialogue_stage = "free";

            vn_controller.start_dialogue(
                "Ariel",
                "I don't want to start class on the first day so you all can go back to what you were doing."
            );

        break;


        case "free":

            dialogue_stage = "final";

            vn_controller.start_dialogue(
                "Ariel",
                "This is a free period for all of you."
            );

        break;


        case "final":

            // ==========================================
            // PREVENT FADE FROM STARTING MORE THAN ONCE
            // ==========================================

            if (transition_active)
            {
                return;
            }


            // ==========================================
            // REMOVE DIALOGUE BEFORE CLOCK SEQUENCE
            // ==========================================

            vn_controller.dialogue_active = false;
            vn_controller.dialogue = "";
            vn_controller.display_text = "";
            vn_controller.speaker = "";
            vn_controller.typing = false;
            vn_controller.line_finished = true;


            // ==========================================
            // HIDE ARIEL
            // ==========================================

            character_manager.hide_character(
                "Ariel"
            );


            // ==========================================
            // START CLOCK TRANSITION
            // ==========================================

            transition_active = true;
            transition_direction = "to_clock";
            transition_alpha = 0;

        break;
    }
}