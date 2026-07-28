// ==========================================
// SCENE 5
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

vn_controller.scene_manager = id;


// ==========================================
// BACKGROUND
// ==========================================

current_background = sRoof;


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


// ==========================================
// FIRST CHOICE
// ==========================================

function start_first_choice()
{
    choice_controller.start_choice(
    [
        "I've seen you.",
        "That makes sense.",
        "Smoking is bad for you.",
        "..."
    ],
    choice_selected
    );
}


// ==========================================
// SECOND CHOICE
// ==========================================

function start_second_choice()
{
    choice_controller.start_choice(
    [
        "People hang out with me.",
        "Thanks for the tip.",
        "I'm leaving.",
        "..."
    ],
    choice_selected
    );
}


// ==========================================
// CHOICE CALLBACK
// ==========================================

function choice_selected(_choice)
{
    // ======================================
    // FIRST CHOICE
    // ======================================

    if (dialogue_stage == "choice1")
    {
        character_manager.set_active_character(
            "Ariel"
        );

        switch(_choice)
        {
            case 0:

                dialogue_stage = "after_choice1";

                vn_controller.start_dialogue(
                    "Ariel",
                    "But you wouldn't tell anyone would you?"
                );

            break;


            case 1:

                dialogue_stage = "after_choice1";

                vn_controller.start_dialogue(
                    "Ariel",
                    "I knew you would understand."
                );

            break;


            case 2:

                dialogue_stage = "after_choice1";

                vn_controller.start_dialogue(
                    "Ariel",
                    "Let's agree to disagree."
                );

            break;


            case 3:

                dialogue_stage = "after_choice1";

                vn_controller.start_dialogue(
                    "Ariel",
                    "..."
                );

            break;
        }
    }


    // ======================================
    // SECOND CHOICE
    // ======================================

    else if (dialogue_stage == "choice2")
    {
        character_manager.set_active_character(
            "Ariel"
        );

        switch(_choice)
        {
            case 0:

                dialogue_stage = "scene_complete";

                vn_controller.start_dialogue(
                    "Ariel",
                    "Yeah for sure kid, I believe you."
                );

            break;


            case 1:

                dialogue_stage = "scene_complete";

                vn_controller.start_dialogue(
                    "Ariel",
                    "Don't mention it."
                );

            break;


            case 2:

                dialogue_stage = "scene_complete";

                vn_controller.start_dialogue(
                    "Ariel",
                    "Damn, you're fragile aren't you?"
                );

            break;


            case 3:

                dialogue_stage = "scene_complete";

                vn_controller.start_dialogue(
                    "Ariel",
                    "Ok, quit loitering around. Go back to class now, break's 'bout to get over."
                );

            break;
        }
    }
}

// ==========================================
// DIALOGUE CALLBACK
// ==========================================

function dialogue_finished()
{
    switch (dialogue_stage)
    {
        // ==================================
        // INTRO
        // ==================================

        case "intro":

            dialogue_stage = "smoking";

            // Ariel fades in after the anonymous voice
            character_manager.show_character(
                character_manager.ariel,
                "center"
            );

            character_manager.set_active_character(
                "Ariel"
            );

            character_manager.change_expression(
                character_manager.ariel,
                "smoking"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "I don't think you should be here during lunch time."
            );

        break;


        // ==================================
        // MC
        // ==================================

        case "smoking":

            dialogue_stage = "fair_point";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "I don't think you should be smoking in school either."
            );

        break;


        // ==================================
        // FAIR POINT
        // ==================================

        case "fair_point":

            dialogue_stage = "matter";

            character_manager.set_active_character(
                "Ariel"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "You make a fair point."
            );

        break;


        case "matter":

            dialogue_stage = "choice_prompt";

            vn_controller.start_dialogue(
                "Ariel",
                "But it shouldn't really matter as long as no one sees me."
            );

        break;


        // ==================================
        // FIRST CHOICE
        // ==================================

        case "choice_prompt":

            dialogue_stage = "choice1";

            start_first_choice();

        break;


        // ==================================
        // AFTER FIRST CHOICE
        // ==================================

        case "after_choice1":

            dialogue_stage = "name";

            character_manager.change_expression(
                character_manager.ariel,
                "default"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "What's your name kid?"
            );

        break;


        case "name":

            dialogue_stage = "mc_name";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                global.player_name
            );

        break;


        case "mc_name":

            dialogue_stage = "roof";

            character_manager.set_active_character(
                "Ariel"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "So tell me what brings you to the roof?"
            );

        break;


        case "roof":

            dialogue_stage = "quiet";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "I just like how nice and quiet it is."
            );

        break;


        case "quiet":

            dialogue_stage = "hmm";

            character_manager.set_active_character(
                "Ariel"
            );

            character_manager.change_expression(
                character_manager.ariel,
                "smoking"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "Hmm."
            );

        break;


        case "hmm":

            dialogue_stage = "friends";

            vn_controller.start_dialogue(
                "Ariel",
                "Sounds like something a guy with no friends would say."
            );

        break;


        case "friends":

            dialogue_stage = "hey";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Hey!"
            );

        break;

        // ==================================
        // JUST KIDDING
        // ==================================

        case "hey":

            dialogue_stage = "kidding";

            character_manager.set_active_character(
                "Ariel"
            );

            character_manager.change_expression(
                character_manager.ariel,
                "default"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "I'm just kidding, don't be so serious."
            );

        break;


        case "kidding":

            dialogue_stage = "summer";

            vn_controller.start_dialogue(
                "Ariel",
                "So tell me, what did you do during your summer vacation."
            );

        break;


        // ==================================
        // SUMMER
        // ==================================

        case "summer":

            dialogue_stage = "games";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "I stayed home and played video games all day."
            );

        break;


        // ==================================
        // HMMM
        // ==================================

        case "games":

            dialogue_stage = "loner";

            character_manager.set_active_character(
                "Ariel"
            );

            character_manager.change_expression(
                character_manager.ariel,
                "smoking"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "Hmmm."
            );

        break;


        case "loner":

            dialogue_stage = "leave";

            vn_controller.start_dialogue(
                "Ariel",
                "As I suspected, classic loner behavior."
            );

        break;


        // ==================================
        // I'M LEAVING
        // ==================================

        case "leave":

            dialogue_stage = "dont_leave";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "I'm leaving."
            );

        break;


        case "dont_leave":

            dialogue_stage = "girlfriend";

            character_manager.set_active_character(
                "Ariel"
            );

            character_manager.change_expression(
                character_manager.ariel,
                "default"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "Hey hey! Don't leave, won't let a girl crack a joke? Jeez."
            );

        break;


        case "girlfriend":

            dialogue_stage = "ask_gf";

            vn_controller.start_dialogue(
                "Ariel",
                "Tell me kid, you got a girlfriend?"
            );

        break;


        // ==================================
        // NO
        // ==================================

        case "ask_gf":

            dialogue_stage = "smoke_again";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "No..."
            );

        break;


        case "smoke_again":

            dialogue_stage = "pause";

            character_manager.set_active_character(
                "Ariel"
            );

            character_manager.change_expression(
                character_manager.ariel,
                "smoking"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "I don't know why I even asked."
            );

        break;


        case "pause":

            dialogue_stage = "loner2";

            vn_controller.start_dialogue(
                "Ariel",
                "..."
            );

        break;


        case "loner2":

            dialogue_stage = "roof_loser";

            vn_controller.start_dialogue(
                "Ariel",
                "Damn, you really are a loner huh?"
            );

        break;


        case "roof_loser":

            dialogue_stage = "starter_pack";

            vn_controller.start_dialogue(
                "Ariel",
                "Lunch on the roof, no girlfriend."
            );

        break;


        case "starter_pack":

            dialogue_stage = "ring";

            vn_controller.start_dialogue(
                "Ariel",
                "That's the loser starter pack if I've ever seen it."
            );

        break;


        case "ring":

            dialogue_stage = "teacher";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "You're no different yourself. I don't see a ring on that finger."
            );

        break;
	
        // ==================================
        // TEACHER
        // ==================================

        case "teacher":

            dialogue_stage = "teacher_pause";

            character_manager.set_active_character(
                "Ariel"
            );

            character_manager.change_expression(
                character_manager.ariel,
                "default"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "..."
            );

        break;


        case "teacher_pause":

            dialogue_stage = "teacher_line";

            vn_controller.start_dialogue(
                "Ariel",
                "That's no way to talk to a teacher."
            );

        break;


        case "teacher_line":

            dialogue_stage = "teacher_pause2";

            vn_controller.start_dialogue(
                "Ariel",
                "..."
            );

        break;


        case "teacher_pause2":

            dialogue_stage = "joking";

            character_manager.change_expression(
                character_manager.ariel,
                "default"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "I'm just kidding."
            );

        break;


        case "joking":

            dialogue_stage = "cooler";

            vn_controller.start_dialogue(
                "Ariel",
                "I guess you're not wrong. But I was a lot cooler than you when I was your age, that's for sure."
            );

        break;


        case "cooler":

            dialogue_stage = "new_student";

            vn_controller.start_dialogue(
                "Ariel",
                "Tell you what kid, there's a new kid joining the school tomorrow."
            );

        break;


        case "new_student":

            dialogue_stage = "get_along";

            vn_controller.start_dialogue(
                "Ariel",
                "Try and get along with them before they figure out no one hangs out with you."
            );

        break;


        // ==================================
        // SECOND CHOICE
        // ==================================

        case "get_along":

            dialogue_stage = "choice2";

            start_second_choice();

        break;


        // ==================================
        // AFTER SECOND CHOICE
        // ==================================

        case "scene_complete":

            character_manager.hide_character(
                "Ariel"
            );

            transition_active = true;
            transition_alpha = 0;

        break;
    }
}