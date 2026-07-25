// ==========================================
// SCENE 3
// ==========================================


// ==========================================
// FIND MANAGERS
// ==========================================

vn_controller = instance_find(oVNController, 0);
character_manager = instance_find(oCharacterManager, 0);

vn_controller.scene_manager = id;


// ==========================================
// SCENE STATE
// ==========================================

scene_started = false;
dialogue_started = false;

dialogue_stage = "intro";


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
// CLASSROOM TRANSITION
// ==========================================

transition_active = false;
transition_alpha = 0;
transition_state = 0;


// ==========================================
// WAIT TIMER
// ==========================================

wait_timer = room_speed * 4;


// ==========================================
// DIALOGUE FINISHED
// ==========================================

function dialogue_finished()
{
    // ==========================================
    // INTRO
    // ==========================================

    if (dialogue_stage == "hello")
    {
        dialogue_stage = "name";

        vn_controller.start_dialogue(
            "Ariel",
            "My name's Ariel."
        );
    }


    // ==========================================
    // NAME
    // ==========================================

    else if (dialogue_stage == "name")
    {
        dialogue_stage = "teacher";

        vn_controller.start_dialogue(
            "Ariel",
            "I'll be your class teacher this school year."
        );
    }


    // ==========================================
    // ENGLISH
    // ==========================================

    else if (dialogue_stage == "teacher")
    {
        dialogue_stage = "english";

        vn_controller.start_dialogue(
            "Ariel",
            "I'll also be teaching you English."
        );
    }


    // ==========================================
    // HAPPY
    // ==========================================

    else if (dialogue_stage == "english")
    {
        dialogue_stage = "happy";

        character_manager.change_expression(
            character_manager.ariel,
            "default"
        );

        vn_controller.start_dialogue(
            "Ariel",
            "I hope to get along with all of you."
        );
    }


    // ==========================================
    // ...
    // ==========================================

    else if (dialogue_stage == "happy")
    {
        dialogue_stage = "ellipsis";

        vn_controller.start_dialogue(
            "Ariel",
            "..."
        );
    }


    // ==========================================
    // FREE PERIOD
    // ==========================================

    else if (dialogue_stage == "ellipsis")
    {
        dialogue_stage = "free_period";

        character_manager.change_expression(
            character_manager.ariel,
            "default"
        );

        vn_controller.start_dialogue(
            "Ariel",
            "I don't want to start class on the first day so you all can go back to what you were doing."
        );
    }


    // ==========================================
    // FINAL
    // ==========================================

    else if (dialogue_stage == "free_period")
    {
        dialogue_stage = "ending";

        character_manager.change_expression(
            character_manager.ariel,
            "default"
        );

        vn_controller.start_dialogue(
            "Ariel",
            "This is a free period for all of you."
        );
    }


    // ==========================================
    // FADE TO BLACK
    // ==========================================

   else if (dialogue_stage == "ending")
   {
       dialogue_stage = "scene_complete";

       // Fade Ariel out
       character_manager.hide_character("Ariel");

       // Fade screen out
       transition_active = true;
       transition_state = 3;
       transition_alpha = 0;
   }


    // ==========================================
    // COMPLETE
    // ==========================================

    else if (dialogue_stage == "scene_complete")
    {
        // Scene complete.
    }
}