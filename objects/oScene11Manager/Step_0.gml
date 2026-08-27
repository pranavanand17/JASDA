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
        // ==========================================
        // MC - CLUBROOM
        // ==========================================

        case "intro":

            dialogue_stage = "jasda_big";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Wow, it's way bigger than my previous school's club room."
            );

        break;


        // ==========================================
        // WHAT DO YOU GUYS DO HERE
        // ==========================================

        case "jasda_big":

            dialogue_stage = "mc_nothing";

            vn_controller.start_dialogue(
                "Jasda",
                "What do you guys do here?"
            );

        break;


        // ==========================================
        // MC - NOTHING
        // ==========================================

        case "mc_nothing":

            dialogue_stage = "jasda_nothing";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "To be completely honest... Nothing."
            );

        break;


        // ==========================================
        // JASDA - NOTHING?
        // ==========================================

        case "jasda_nothing":

            dialogue_stage = "mc_explanation1";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Nothing?"
            );

        break;


        // ==========================================
        // MC - EXPLANATION
        // ==========================================

        case "mc_explanation1":

            dialogue_stage = "mc_explanation2";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "We're forced to stay behind and me and my friend Felix have nothing to do."
            );

        break;


        case "mc_explanation2":

            dialogue_stage = "jasda_cool";

            vn_controller.start_dialogue(
                "{MC}",
                "So we just sit around and talk about random stuff."
            );

        break;


        // ==========================================
        // JASDA - COOL
        // ==========================================

        case "jasda_cool":

            dialogue_stage = "mc_depressing";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Oh that's... cool."
            );

        break;


        // ==========================================
        // MC - DEPRESSING
        // ==========================================

        case "mc_depressing":

            dialogue_stage = "mc_club_activity";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "You don't have to be nice, it's honestly pretty depressing."
            );

        break;


        case "mc_club_activity":

            dialogue_stage = "jasda_club";

            vn_controller.start_dialogue(
                "{MC}",
                "If you like you could join some club activity."
            );

        break;


        // ==========================================
        // JASDA - CLUB
        // ==========================================

        case "jasda_club":

            dialogue_stage = "jasda_what_club";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Ooh! That's cool."
            );

        break;


        case "jasda_what_club":

            dialogue_stage = "mc_club_list";

            vn_controller.start_dialogue(
                "Jasda",
                "What club can I join?"
            );

        break;


        // ==========================================
        // MC - CLUB LIST
        // ==========================================

        case "mc_club_list":

            dialogue_stage = "mc_amber";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "There's a lot I'm not really sure."
            );

        break;


        case "mc_amber":

            dialogue_stage = "jasda_who_amber";

            vn_controller.start_dialogue(
                "{MC}",
                "Amber's in the occult club I think, you could check that out."
            );

        break;


        // ==========================================
        // JASDA - WHO'S AMBER
        // ==========================================

        case "jasda_who_amber":

            dialogue_stage = "mc_amber_explanation1";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Who's Amber?"
            );

        break;


        // ==========================================
        // MC - AMBER EXPLANATION
        // ==========================================

        case "mc_amber_explanation1":

            dialogue_stage = "mc_amber_explanation2";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "It's this girl I walk to school with."
            );

        break;


        case "mc_amber_explanation2":

            dialogue_stage = "mc_amber_explanation3";

            vn_controller.start_dialogue(
                "{MC}",
                "She's honestly the main reason I stay back anyway."
            );

        break;


        case "mc_amber_explanation3":

            dialogue_stage = "jasda_oh";

            vn_controller.start_dialogue(
                "{MC}",
                "I have to walk home with her as well."
            );

        break;


        // ==========================================
        // JASDA - OH
        // ==========================================

        case "jasda_oh":

            dialogue_stage = "jasda_pause";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Oh..."
            );

        break;


        case "jasda_pause":

            dialogue_stage = "jasda_girlfriend";

            vn_controller.start_dialogue(
                "Jasda",
                "..."
            );

        break;


        case "jasda_girlfriend":

            dialogue_stage = "mc_not_girlfriend";

            vn_controller.start_dialogue(
                "Jasda",
                "Is she your girlfriend?"
            );

        break;


        // ==========================================
        // MC - NOT GIRLFRIEND
        // ==========================================

        case "mc_not_girlfriend":

            dialogue_stage = "mc_walk_home";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "No no she's not."
            );

        break;


        case "mc_walk_home":

            dialogue_stage = "mc_stalker";

            vn_controller.start_dialogue(
                "{MC}",
                "I just walk home with her because she's prolly scared to go home by herself."
            );

        break;


        case "mc_stalker":

            dialogue_stage = "mc_weird";

            vn_controller.start_dialogue(
                "{MC}",
                "I think she thinks she has a stalker or something."
            );

        break;


        case "mc_weird":

            dialogue_stage = "anonymous_weird";

            vn_controller.start_dialogue(
                "{MC}",
                "She's kinda weird like that."
            );

        break;


        // ==========================================
        // ANONYMOUS - WHO'S WEIRD
        // ==========================================

        case "anonymous_weird":

            dialogue_stage = "amber_stalker";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "Anonymous",
                "Who's weird?"
            );

        break;


        // ==========================================
        // AMBER APPEARS
        // ==========================================

        case "amber_stalker":

            dialogue_stage = "amber_not_weird";

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
                "I'm not weird."
            );

        break;


        case "amber_not_weird":

            dialogue_stage = "amber_dont_think";

            vn_controller.start_dialogue(
                "Amber",
                "Also I don't think I have a stalker."
            );

        break;


        case "amber_dont_think":

            dialogue_stage = "amber_know";

            vn_controller.start_dialogue(
                "Amber",
                "I know I have one."
            );

        break;


        case "amber_know":

            dialogue_stage = "amber_seen";

            vn_controller.start_dialogue(
                "Amber",
                "I've seen him."
            );

        break;


        // ==========================================
        // JASDA - STALKER
        // ==========================================

        case "amber_seen":

            dialogue_stage = "jasda_scary";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Oh no, a stalker?"
            );

        break;


        case "jasda_scary":

            dialogue_stage = "anonymous_stalker";

            vn_controller.start_dialogue(
                "Jasda",
                "That's scary."
            );

        break;


        // ==========================================
        // ANONYMOUS - STALKER
        // ==========================================

        case "anonymous_stalker":

            dialogue_stage = "felix_stalker";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "Anonymous",
                "A stalker?"
            );

        break;


        // ==========================================
        // FELIX APPEARS
        // ==========================================

        case "felix_stalker":

            dialogue_stage = "amber_stalker_question";

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


        // ==========================================
        // AMBER - ANNOYING
        // ==========================================

        case "amber_stalker_question":

            dialogue_stage = "felix_help";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Yeah, it's annoying."
            );

        break;


        // ==========================================
        // FELIX - OFFER
        // ==========================================

        case "felix_help":

            dialogue_stage = "felix_karate";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "I could scare him off for you today on your way back from school."
            );

        break;


        case "felix_karate":

            dialogue_stage = "amber_no";

            vn_controller.start_dialogue(
                "Felix",
                "I don't mean to brag but I have a black belt in Karate-"
            );

        break;


        // ==========================================
        // AMBER - NO
        // ==========================================

        case "amber_no":

            dialogue_stage = "amber_walk";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "No dude, I'm good."
            );

        break;


        case "amber_walk":

            dialogue_stage = "amber_told";

            vn_controller.start_dialogue(
                "Amber",
                "I'm fine walking home with {MC}."
            );

        break;


        case "amber_told":

            dialogue_stage = "felix_embarrassed";

            vn_controller.start_dialogue(
                "Amber",
                "I thought I told you already."
            );

        break;


        // ==========================================
        // FELIX - EMBARRASSED
        // ==========================================

        case "felix_embarrassed":

            dialogue_stage = "felix_pause";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Oh yeah right."
            );

        break;


        case "felix_pause":

            dialogue_stage = "felix_leaving";

            vn_controller.start_dialogue(
                "Felix",
                "..."
            );

        break;


        case "felix_leaving":

            dialogue_stage = "felix_goodbye";

            vn_controller.start_dialogue(
                "Felix",
                "Anyway... I'll be heading home now."
            );

        break;


        case "felix_goodbye":

            dialogue_stage = "mc_head_home";

            vn_controller.start_dialogue(
                "Felix",
                "See you later {MC}"
            );

        break;


        // ==========================================
        // MC - HEADING HOME
        // ==========================================

        case "mc_head_home":

            dialogue_stage = "mc_jasda_goodbye";

            character_manager.hide_character(
                "Felix"
            );

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "I guess we'll head home as well."
            );

        break;


        case "mc_jasda_goodbye":

            dialogue_stage = "jasda_goodbye";

            vn_controller.start_dialogue(
                "{MC}",
                "See you later Jasda"
            );

        break;


        // ==========================================
        // JASDA - GOODBYE
        // ==========================================

        case "jasda_goodbye":

            dialogue_stage = "jasda_take_care";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "See ya."
            );

        break;


        case "jasda_take_care":

            dialogue_stage = "end";

            vn_controller.start_dialogue(
                "Jasda",
                "Both of you take care."
            );

        break;


        // ==========================================
        // SCENE COMPLETE
        // ==========================================

        case "end":

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