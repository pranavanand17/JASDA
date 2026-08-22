// ==========================================
// FIND VN CONTROLLER
// ==========================================

if (vn_controller == noone)
{
    vn_controller = instance_find(
        oVNController,
        0
    );
}


// ==========================================
// FADE IN
// ==========================================

if (fade_alpha > 0)
{
    fade_alpha -= fade_speed;

    if (fade_alpha < 0)
    {
        fade_alpha = 0;
    }
}


// ==========================================
// START SCENE
// ==========================================

if (!scene_started)
{
    scene_started = true;

    // --------------------------------------
    // SHOW JASDA
    // --------------------------------------

    character_manager.show_character(
        character_manager.jasda,
        "center"
    );

    character_manager.set_active_character(
        "Jasda"
    );

    character_manager.change_expression(
        character_manager.jasda,
        "default"
    );
}


// ==========================================
// START DIALOGUE
// ==========================================

if (
    scene_started &&
    !dialogue_started
)
{
    dialogue_started = true;

    vn_controller.start_dialogue(
        "{MC}",
        "This is the clubroom"
    );
}


// ==========================================
// DIALOGUE CALLBACK
// ==========================================

function dialogue_finished()
{
    switch (dialogue_stage)
    {
        // ==================================
        // MC - CLUBROOM
        // ==================================

        case "intro":

            dialogue_stage = "jasda_big";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Wow, it's way bigger than my previous school's club room.\nWhat do you guys do here?"
            );

        break;


        // ==================================
        // JASDA - CLUBROOM
        // ==================================

        case "jasda_big":

            dialogue_stage = "mc_nothing";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "To be completely honest... Nothing."
            );

        break;


        // ==================================
        // MC - NOTHING
        // ==================================

        case "mc_nothing":

            dialogue_stage = "jasda_nothing";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Nothing?"
            );

        break;


        // ==================================
        // JASDA - NOTHING?
        // ==================================

        case "jasda_nothing":

            dialogue_stage = "mc_explanation";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "We're forced to stay behind and me and my friend Felix have nothing to do.\nSo we just sit around and talk about random stuff."
            );

        break;


        // ==================================
        // MC - EXPLANATION
        // ==================================

        case "mc_explanation":

            dialogue_stage = "jasda_cool";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Oh that's... cool."
            );

        break;


        // ==================================
        // JASDA - COOL
        // ==================================

        case "jasda_cool":

            dialogue_stage = "mc_club_activity";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "You don't have to be nice, it's honestly pretty depressing.\nIf you like you could join some club activity."
            );

        break;


        // ==================================
        // MC - CLUB ACTIVITY
        // ==================================

        case "mc_club_activity":

            dialogue_stage = "jasda_club";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Ooh! That's cool.\nWhat club can I join?"
            );

        break;


        // ==================================
        // JASDA - WHAT CLUB
        // ==================================

        case "jasda_club":

            dialogue_stage = "mc_amber_club";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "There's a lot I'm not really sure.\nAmber's in the occult club I think, you could check that out."
            );

        break;


        // ==================================
        // MC - AMBER CLUB
        // ==================================

        case "mc_amber_club":

            dialogue_stage = "jasda_who_amber";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Who's Amber?"
            );

        break;


        // ==================================
        // JASDA - WHO'S AMBER
        // ==================================

        case "jasda_who_amber":

            dialogue_stage = "mc_amber_explanation";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "It's this girl I walk to school with.\nShe's honestly the main reason I stay back anyway.\nI have to walk home with her as well."
            );

        break;


        // ==================================
        // MC - AMBER EXPLANATION
        // ==================================

        case "mc_amber_explanation":

            dialogue_stage = "jasda_girlfriend";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Oh...\n...\nIs she your girlfriend?"
            );

        break;


        // ==================================
        // JASDA - GIRLFRIEND
        // ==================================

        case "jasda_girlfriend":

            dialogue_stage = "mc_not_girlfriend";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "No no she's not.\nI just walk home with her because she's prolly scared to go home by herself.\nI think she thinks she has a stalker or something.\nShe's kinda weird like that."
            );

        break;


        // ==================================
        // MC - STALKER
        // ==================================

        case "mc_not_girlfriend":

            dialogue_stage = "anonymous_weird";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "Anonymous",
                "Who's weird?"
            );

        break;


        // ==================================
        // ANONYMOUS - WHO'S WEIRD
        // ==================================

        case "anonymous_weird":

            dialogue_stage = "amber_stalker";

            character_manager.show_character(
                character_manager.amber,
                "right"
            );

            character_manager.set_active_character(
                "Amber"
            );

            character_manager.change_expression(
                character_manager.amber,
                "default"
            );

            vn_controller.start_dialogue(
                "Amber",
                "I'm not weird.\nAlso I don't think I have a stalker.\nI know I have one.\nI've seen him."
            );

        break;


        // ==================================
        // AMBER - STALKER
        // ==================================

        case "amber_stalker":

            dialogue_stage = "jasda_scared";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Oh no, a stalker?\nThat's scary."
            );

        break;


        // ==================================
        // JASDA - STALKER
        // ==================================

        case "jasda_scared":

            dialogue_stage = "anonymous_stalker";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "Anonymous",
                "A stalker?"
            );

        break;


        // ==================================
        // ANONYMOUS - A STALKER?
        // ==================================

        case "anonymous_stalker":

            dialogue_stage = "felix_stalker";

            character_manager.show_character(
                character_manager.felix,
                "left"
            );

            character_manager.set_active_character(
                "Felix"
            );

            character_manager.change_expression(
                character_manager.felix,
                "default"
            );

            vn_controller.start_dialogue(
                "Felix",
                "You have a stalker Amber?"
            );

        break;


        // ==================================
        // FELIX - STALKER
        // ==================================

        case "felix_stalker":

            dialogue_stage = "amber_annoying";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Yeah, it's annoying."
            );

        break;


        // ==================================
        // AMBER - ANNOYING
        // ==================================

        case "amber_annoying":

            dialogue_stage = "felix_help";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "I could scare him off for you today on your way back from school.\nI don't mean to brag but I have a black belt in Karate-"
            );

        break;


        // ==================================
        // FELIX - KARATE
        // ==================================

        case "felix_help":

            dialogue_stage = "amber_no";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "No dude, I'm good.\nI'm fine walking home with {MC}.\nI thought I told you already."
            );

        break;


        // ==================================
        // AMBER - I'M GOOD
        // ==================================

        case "amber_no":

            dialogue_stage = "felix_embarrassed";

            character_manager.set_active_character(
                "Felix"
            );

            character_manager.change_expression(
                character_manager.felix,
                "embarrassed"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Oh yeah right.\n...\nAnyway... I'll be heading home now.\nSee you later {MC}"
            );

        break;


        // ==================================
        // FELIX - LEAVING
        // ==================================

        case "felix_embarrassed":

            dialogue_stage = "mc_goodbye";

            character_manager.hide_character(
                "Felix"
            );

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "I guess we'll head home as well.\nSee you later Jasda"
            );

        break;


        // ==================================
        // MC - SEE YOU LATER JASDA
        // ==================================

        case "mc_goodbye":

            dialogue_stage = "jasda_goodbye";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "See ya.\nBoth of you take care."
            );

        break;


        // ==================================
        // JASDA - TAKE CARE
        // ==================================

        case "jasda_goodbye":

            character_manager.hide_character(
                "Jasda"
            );

            character_manager.hide_character(
                "Amber"
            );

            transition_active = true;
            transition_alpha = 0;

        break;
    }
}


// ==========================================
// FADE TO BLACK
// ==========================================

if (transition_active)
{
    transition_alpha += fade_speed;

    if (transition_alpha >= 1)
    {
        transition_alpha = 1;

        // Next scene goes here later.
        // Keep the screen black.
    }
}