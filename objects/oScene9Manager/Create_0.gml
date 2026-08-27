// ==========================================
// SCENE 9
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
// CONNECT SCENE MANAGER
// ==========================================

if (vn_controller != noone)
{
    vn_controller.scene_manager = id;
}


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
// SCENE STATE
// ==========================================

scene_started = false;
dialogue_started = false;

dialogue_stage = "intro";


// ==========================================
// CHOICE STATE
// ==========================================

choice_started = false;


// ==========================================
// START CHOICE
// ==========================================

function start_choice()
{
    if (choice_controller == noone)
    {
        return;
    }

    choice_controller.start_choice(
        [
            "Go for it",
            "Trust your gut"
        ],
        choice_selected
    );
}


// ==========================================
// CHOICE CALLBACK
// ==========================================

function choice_selected(_choice)
{
    // ==========================================
    // GO FOR IT
    // ==========================================

    if (_choice == 0)
    {
        dialogue_stage = "choice_go_for_it";

        character_manager.set_active_character(
            "Ariel"
        );

        vn_controller.start_dialogue(
            "Ariel",
            "Sure kid."
        );
    }


    // ==========================================
    // TRUST YOUR GUT
    // ==========================================

    else if (_choice == 1)
    {
        dialogue_stage = "choice_trust_gut";

        character_manager.set_active_character(
            "Ariel"
        );

        vn_controller.start_dialogue(
            "Ariel",
            "Sure kid."
        );
    }
}


// ==========================================
// DIALOGUE CALLBACK
// ==========================================

function dialogue_finished()
{
    switch (dialogue_stage)
    {
        // ==========================================
        // INTRO
        // ==========================================

        case "intro":

            dialogue_stage = "ariel_how";

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
                "How'd it go?"
            );

        break;


        // ==========================================
        // HOW'D IT GO
        // ==========================================

        case "ariel_how":

            dialogue_stage = "mc_how";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "How'd what go?"
            );

        break;


        // ==========================================
        // YOU KNOW WHAT
        // ==========================================

        case "mc_how":

            dialogue_stage = "mc_that";

            character_manager.set_active_character(
                "Ariel"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "You know what."
            );

        break;


        // ==========================================
        // OH... THAT
        // ==========================================

        case "mc_that":

            dialogue_stage = "mc_why";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Oh...that."
            );

        break;


        // ==========================================
        // WHY DID YOU MAKE HER SIT NEXT TO ME
        // ==========================================

        case "mc_why":

            dialogue_stage = "mc_ship";

            vn_controller.start_dialogue(
                "{MC}",
                "Yeah how come you made her sit next to me."
            );

        break;


        // ==========================================
        // YOU TRYNA SHIP YOUR STUDENTS
        // ==========================================

        case "mc_ship":

            dialogue_stage = "ariel_woah";

            vn_controller.start_dialogue(
                "{MC}",
                "You tryna ship your students? That's weird if you ask me."
            );

        break;


        // ==========================================
        // WOAH
        // ==========================================

        case "ariel_woah":

            dialogue_stage = "ariel_accuse";

            character_manager.set_active_character(
                "Ariel"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "Woah!"
            );

        break;


        // ==========================================
        // DON'T ACCUSE ME
        // ==========================================

        case "ariel_accuse":

            dialogue_stage = "ariel_never";

            vn_controller.start_dialogue(
                "Ariel",
                "Don't go accusing me of inappropriate things kid."
            );

        break;


        // ==========================================
        // I WOULD NEVER
        // ==========================================

        case "ariel_never":

            dialogue_stage = "ariel_help";

            vn_controller.start_dialogue(
                "Ariel",
                "I would never do that."
            );

        break;


        // ==========================================
        // HELP YOU MAKE A FRIEND
        // ==========================================

        case "ariel_help":

            dialogue_stage = "mc_pause_thanks";

            vn_controller.start_dialogue(
                "Ariel",
                "I just thought I could maybe help you make a new friend is all."
            );

        break;


        // ==========================================
        // MC PAUSE
        // ==========================================

        case "mc_pause_thanks":

            dialogue_stage = "mc_thanks";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "..."
            );

        break;


        // ==========================================
        // THANKS
        // ==========================================

        case "mc_thanks":

            dialogue_stage = "ariel_no_worries";

            vn_controller.start_dialogue(
                "{MC}",
                "Thanks for looking out for me"
            );

        break;


        // ==========================================
        // NO WORRIES
        // ==========================================

        case "ariel_no_worries":

            dialogue_stage = "mc_pause_depressed";

            character_manager.set_active_character(
                "Ariel"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "No worries"
            );

        break;


        // ==========================================
        // MC PAUSE
        // ==========================================

        case "mc_pause_depressed":

            dialogue_stage = "mc_how_smoking";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "..."
            );

        break;


        // ==========================================
        // WHY ARE YOU SMOKING
        // ==========================================

        case "mc_how_smoking":

            dialogue_stage = "mc_depressed";

            vn_controller.start_dialogue(
                "{MC}",
                "Hey so tell me how come you're always up here smoking by yourself?"
            );

        break;


        // ==========================================
        // ARE YOU DEPRESSED
        // ==========================================

        case "mc_depressed":

            dialogue_stage = "ariel_depressed";

            vn_controller.start_dialogue(
                "{MC}",
                "Are you depressed?"
            );

        break;


        // ==========================================
        // DEPRESSED? NOPE.
        // ==========================================

        case "ariel_depressed":

            dialogue_stage = "ariel_lost";

            character_manager.set_active_character(
                "Ariel"
            );

            character_manager.change_expression(
                character_manager.ariel,
                "smoking"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "Depressed? Nope."
            );

        break;


        // ==========================================
        // LOST... MAYBE.
        // ==========================================

        case "ariel_lost":

            dialogue_stage = "mc_what_lost";

            vn_controller.start_dialogue(
                "Ariel",
                "Lost... maybe."
            );

        break;


        // ==========================================
        // WHAT'S GOT YOU LOST
        // ==========================================

        case "mc_what_lost":

            dialogue_stage = "ariel_student";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "What's got you lost?"
            );

        break;


        // ==========================================
        // SHOULDN'T DISCUSS
        // ==========================================

        case "ariel_student":

            dialogue_stage = "mc_fair_1";

            character_manager.set_active_character(
                "Ariel"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "I don't know if it's something I should be discussing with a student"
            );

        break;


        // ==========================================
        // IF YOU CAN SHIT ON ME
        // ==========================================

        case "mc_fair_1":

            dialogue_stage = "mc_fair_2";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Hey if you can shit on me about being single"
            );

        break;


        // ==========================================
        // I GET TO ASK YOU
        // ==========================================

        case "mc_fair_2":

            dialogue_stage = "ariel_fair";

            vn_controller.start_dialogue(
                "{MC}",
                "I get to ask you about your life."
            );

        break;


        // ==========================================
        // THAT'S FAIR
        // ==========================================

        case "ariel_fair":

            dialogue_stage = "ariel_guy";

            character_manager.set_active_character(
                "Ariel"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "That's fair."
            );

        break;


        // ==========================================
        // INTO THIS GUY
        // ==========================================

        case "ariel_guy":

            dialogue_stage = "mc_ask_him_pause";

            vn_controller.start_dialogue(
                "Ariel",
                "Well, it's just that I'm kinda into this guy but I'm not sure what to do about it."
            );

        break;


        // ==========================================
        // MC PAUSE
        // ==========================================

        case "mc_ask_him_pause":

            dialogue_stage = "mc_ask_him";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "..."
            );

        break;


        // ==========================================
        // WHY DON'T YOU ASK HIM OUT
        // ==========================================

        case "mc_ask_him":

            dialogue_stage = "ariel_well";

            vn_controller.start_dialogue(
                "{MC}",
                "Why don't you ask him out?"
            );

        break;


        // ==========================================
        // ARIEL WELL
        // ==========================================

        case "ariel_well":

            dialogue_stage = "ariel_inappropriate";

            character_manager.set_active_character(
                "Ariel"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "Well..."
            );

        break;


        // ==========================================
        // NOT APPROPRIATE
        // ==========================================

        case "ariel_inappropriate":

            dialogue_stage = "mc_trust_gut";

            vn_controller.start_dialogue(
                "Ariel",
                "I think asking him out might not be appropriate of me."
            );

        break;


        // ==========================================
        // MC TRUST YOUR GUT
        // ==========================================

        case "mc_trust_gut":

            dialogue_stage = "choice";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Well... If you think it's inappropriate then maybe you should trust your gut."
            );

        break;


        // ==========================================
        // START CHOICE
        // ==========================================

        case "choice":

            start_choice();

        break;


        // ==========================================
        // GO FOR IT RESPONSE
        // ==========================================

        case "choice_go_for_it":

            dialogue_stage = "consider";

            vn_controller.start_dialogue(
                "Ariel",
                "I'll take that into consideration, I guess."
            );

        break;


        // ==========================================
        // TRUST YOUR GUT RESPONSE
        // ==========================================

        case "choice_trust_gut":

            dialogue_stage = "consider";

            vn_controller.start_dialogue(
                "Ariel",
                "I'll take that into consideration, I guess."
            );

        break;


        // ==========================================
        // DON'T LOOK SO DISTRAUGHT
        // ==========================================

        case "consider":

            dialogue_stage = "mc_distraught";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Don't look so distraught."
            );

        break;


        // ==========================================
        // OTHER GUYS
        // ==========================================

        case "mc_distraught":

            dialogue_stage = "mc_other_guys";

            vn_controller.start_dialogue(
                "{MC}",
                "I'm sure there's plenty of other guys who would love to go out with you."
            );

        break;


        // ==========================================
        // NOT SURE THAT'S ANY WAY
        // ==========================================

        case "mc_other_guys":

            dialogue_stage = "ariel_laugh";

            character_manager.set_active_character(
                "Ariel"
            );

            character_manager.change_expression(
                character_manager.ariel,
                "slight_smile"
            );

            vn_controller.start_dialogue(
                "Ariel",
                "Not sure that's any way to talk to your teacher."
            );

        break;


        // ==========================================
        // LAUGHS
        // ==========================================

        case "ariel_laugh":

            dialogue_stage = "ariel_but_thanks";

            vn_controller.start_dialogue(
                "Ariel",
                "(laughs)"
            );

        break;


        // ==========================================
        // BUT THANKS
        // ==========================================

        case "ariel_but_thanks":

            dialogue_stage = "mc_final_pause";

            vn_controller.start_dialogue(
                "Ariel",
                "But thanks."
            );

        break;


        // ==========================================
        // MC PAUSE
        // ==========================================

        case "mc_final_pause":

            dialogue_stage = "mc_confiding";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "..."
            );

        break;


        // ==========================================
        // FINAL THANKS
        // ==========================================

        case "mc_confiding":

            dialogue_stage = "end";

            vn_controller.start_dialogue(
                "{MC}",
                "Thank you for confiding in me as well."
            );

        break;


        // ==========================================
        // SCENE COMPLETE
        // ==========================================

        case "end":

            character_manager.hide_character(
                "Ariel"
            );

            transition_active = true;
            transition_alpha = 0;

        break;
    }
}