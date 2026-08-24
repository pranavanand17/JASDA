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
    // SHOW FELIX
    // --------------------------------------

    character_manager.show_character(
        character_manager.felix,
        "center"
    );

    character_manager.set_active_character(
        "Felix"
    );

    character_manager.change_expression(
        character_manager.felix,
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
        "Felix",
        "I'm telling you dude you gotta step out more man."
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
        // FELIX - STEP OUT
        // ==================================

        case "intro":

            dialogue_stage = "mc_step_out";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "I think I step out enough."
            );

        break;


        // ==================================
        // MC - STEP OUT
        // ==================================

        case "mc_step_out":

            dialogue_stage = "felix_shut_in";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Nah bro, you ain't been touching no grass man.\nHow you gonna get that girl when you's a shut in?"
            );

        break;


        // ==================================
        // FELIX - SHUT IN
        // ==================================

        case "felix_shut_in":

            dialogue_stage = "mc_which_girl";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Which girl?"
            );

        break;


        // ==================================
        // MC - WHICH GIRL
        // ==================================

        case "mc_which_girl":

            dialogue_stage = "felix_jasda";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Man, I swear to god. I'm about to beat the shit outta you.\nStop trying to be nonchalant with me bitch.\nJasda!\nYou like her don't you?"
            );

        break;


        // ==================================
        // FELIX - YOU LIKE JASDA
        // ==================================

        case "felix_jasda":

            dialogue_stage = "mc_likes_jasda";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Yes."
            );

        break;


        // ==================================
        // MC - YES
        // ==================================

        case "mc_likes_jasda":

            dialogue_stage = "felix_girls_shutins";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Yeah dude, girls don't like shut-ins."
            );

        break;


        // ==================================
        // FELIX - GIRLS DON'T LIKE SHUT INS
        // ==================================

        case "felix_girls_shutins":

            dialogue_stage = "mc_how_know";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "How would you know what girls like?\nYou've never been with one yourself."
            );

        break;


        // ==================================
        // MC - HOW WOULD YOU KNOW
        // ==================================

        case "mc_how_know":

            dialogue_stage = "felix_instinct";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "It's an instinct dude."
            );

        break;


        // ==================================
        // FELIX - INSTINCT
        // ==================================

        case "felix_instinct":

            dialogue_stage = "mc_some_instinct";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Some instinct."
            );

        break;


        // ==================================
        // MC - SOME INSTINCT
        // ==================================

        case "mc_some_instinct":

            dialogue_stage = "felix_mr_leon";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Tell you what man.\nI've heard all the girls in our grade have a thing for Mr. Leon."
            );

        break;


        // ==================================
        // FELIX - MR LEON
        // ==================================

        case "felix_mr_leon":

            dialogue_stage = "mc_gym_teacher";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "The gym teacher?"
            );

        break;


        // ==================================
        // MC - GYM TEACHER
        // ==================================

        case "mc_gym_teacher":

            dialogue_stage = "felix_charismatic";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Yeah dude, he's charismatic as fuck."
            );

        break;


        // ==================================
        // FELIX - CHARISMATIC
        // ==================================

        case "felix_charismatic":

            dialogue_stage = "mc_what_about_it";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "What about it?"
            );

        break;


        // ==================================
        // MC - WHAT ABOUT IT
        // ==================================

        case "mc_what_about_it":

            dialogue_stage = "felix_advice";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "How 'bout tomorrow during gym class we ask him for advice on how to get girls."
            );

        break;


        // ==================================
        // FELIX - ASK LEON
        // ==================================

        case "felix_advice":

            dialogue_stage = "mc_bad_idea";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "I don't know if that's such a good idea."
            );

        break;


        // ==================================
        // MC - BAD IDEA
        // ==================================

        case "mc_bad_idea":

            dialogue_stage = "felix_down";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "It is dude!\nYou down or what?"
            );

        break;


        // ==================================
        // FELIX - YOU DOWN
        // ==================================

        case "felix_down":

            dialogue_stage = "mc_sure";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Sure, whatever..."
            );

        break;


        // ==================================
        // MC - SURE
        // ==================================

        case "mc_sure":

            dialogue_stage = "felix_deal";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "That's what I'm talking about.\nYou help me get Amber.\nAnd I'll help you get Jasda.\nDeal?"
            );

        break;


        // ==================================
        // FELIX - DEAL
        // ==================================

        case "felix_deal":

            dialogue_stage = "mc_deal";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Deal."
            );

        break;


        // ==================================
        // MC - DEAL
        // ==================================

        case "mc_deal":

            dialogue_stage = "amber_enters";

            // --------------------------------
            // AMBER ENTERS
            // --------------------------------

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
                "What you boys talking about?"
            );

        break;


        // ==================================
        // AMBER - WHAT YOU BOYS TALKING
        // ==================================

        case "amber_enters":

            dialogue_stage = "mc_nothing";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Nothing..."
            );

        break;


        // ==================================
        // MC - NOTHING
        // ==================================

        case "mc_nothing":

            dialogue_stage = "felix_movie";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "We was talking about... that new horror movie that's out... Weren't we {MC}?"
            );

        break;


        // ==================================
        // FELIX - HORROR MOVIE
        // ==================================

        case "felix_movie":

            dialogue_stage = "mc_movie";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Yeah yeah, the movie yeah.\n...\nCan't wait to check it out."
            );

        break;


        // ==================================
        // MC - MOVIE
        // ==================================

        case "mc_movie":

            dialogue_stage = "amber_come";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Weird.\nWell I'll come with."
            );

        break;


        // ==================================
        // AMBER - I'LL COME
        // ==================================

        case "amber_come":

            dialogue_stage = "felix_excited";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "YOU WILL?"
            );

        break;


        // ==================================
        // FELIX - YOU WILL
        // ==================================

        case "felix_excited":

            dialogue_stage = "amber_weekend";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Yeah sure.\nI've been meaning to get out of the house this weekend anyway."
            );

        break;


        // ==================================
        // AMBER - WEEKEND
        // ==================================

        case "amber_weekend":

            dialogue_stage = "felix_manlier";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Awesome!\nThe more the manlier."
            );

        break;


        // ==================================
        // FELIX - MANLIER
        // ==================================

        case "felix_manlier":

            dialogue_stage = "amber_merrier";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "...\nI think you mean merrier."
            );

        break;


        // ==================================
        // AMBER - MERRIER
        // ==================================

        case "amber_merrier":

            dialogue_stage = "felix_jasda_idea";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "That's what I said.\n...\nDude, shouldn't you ask Jasda to come along as well?"
            );

        break;


        // ==================================
        // FELIX - ASK JASDA
        // ==================================

        case "felix_jasda_idea":

            dialogue_stage = "mc_jasda";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Jasda?"
            );

        break;


        // ==================================
        // MC - JASDA
        // ==================================

        case "mc_jasda":

            dialogue_stage = "felix_new_places";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Yeah, she'd get to see some new places around town."
            );

        break;


        // ==================================
        // FELIX - NEW PLACES
        // ==================================

        case "felix_new_places":

            dialogue_stage = "amber_new_girl";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "The new girl?"
            );

        break;


        // ==================================
        // AMBER - NEW GIRL
        // ==================================

        case "amber_new_girl":

            dialogue_stage = "felix_ask_jasda";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Yeah dude, you should totally ask her to join us."
            );

        break;


        // ==================================
        // FELIX - ASK HER
        // ==================================

        case "felix_ask_jasda":

            dialogue_stage = "mc_ask_jasda";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "...\nSure, I'll ask her.\nShe was telling me she wanted to get to know Amber as well.\nSo I guess we could kill two birds with one stone."
            );

        break;


        // ==================================
        // MC - TWO BIRDS
        // ==================================

        case "mc_ask_jasda":

            dialogue_stage = "amber_proud";

            character_manager.set_active_character(
                "Amber"
            );

            character_manager.change_expression(
                character_manager.amber,
                "proud_shy"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Get to know me?\nWhy?"
            );

        break;


        // ==================================
        // AMBER - GET TO KNOW ME
        // ==================================

        case "amber_proud":

            dialogue_stage = "mc_girl_talk";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Girl talk or something, I don't know."
            );

        break;


        // ==================================
        // MC - GIRL TALK
        // ==================================

        case "mc_girl_talk":

            dialogue_stage = "amber_cool";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Sometimes I forget how cool I am."
            );

        break;


        // ==================================
        // AMBER - HOW COOL
        // ==================================

        case "amber_cool":

            dialogue_stage = "mc_not_that";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "I don't think it has anything to do with that."
            );

        break;


        // ==================================
        // MC - NOT THAT
        // ==================================

        case "mc_not_that":

            dialogue_stage = "amber_allow";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Sure you can bring her.\nI'll allow it."
            );

        break;


        // ==================================
        // AMBER - ALLOW IT
        // ==================================

        case "amber_allow":

            dialogue_stage = "mc_permission";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "No one asked you for permission.\n...\nBut sure, I'll ask her."
            );

        break;


        // ==================================
        // MC - PERMISSION
        // ==================================

        case "mc_permission":

            dialogue_stage = "felix_bounce";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Aight dude, I gotta bounce.\nGotta drop my mom off at dance practice."
            );

        break;


        // ==================================
        // FELIX - BOUNCE
        // ==================================

        case "felix_bounce":

            dialogue_stage = "amber_license";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "You have a license?"
            );

        break;


        // ==================================
        // AMBER - LICENSE
        // ==================================

        case "amber_license":

            dialogue_stage = "felix_license";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Yeah."
            );

        break;


        // ==================================
        // FELIX - YEAH
        // ==================================

        case "felix_license":

            dialogue_stage = "amber_cool_dude";

            character_manager.set_active_character(
                "Amber"
            );

            character_manager.change_expression(
                character_manager.amber,
                "shy"
            );

            vn_controller.start_dialogue(
                "Amber",
                "That's cool... dude."
            );

        break;


        // ==================================
        // AMBER - THAT'S COOL
        // ==================================

        case "amber_cool_dude":

            dialogue_stage = "mc_see_ya";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "See ya man."
            );

        break;


        // ==================================
        // MC - SEE YA
        // ==================================

        case "mc_see_ya":

            dialogue_stage = "felix_bye";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Bye dudes!\nSee ya tomorrow in gym class {MC}\n(winks)"
            );

        break;


        // ==================================
        // FELIX - LEAVES
        // ==================================

        case "felix_bye":

            dialogue_stage = "amber_home";

            character_manager.hide_character(
                "Felix"
            );

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "You ready to head home?"
            );

        break;


        // ==================================
        // AMBER - HEAD HOME
        // ==================================

        case "amber_home":

            dialogue_stage = "mc_home";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Sure."
            );

        break;


        // ==================================
        // MC - SURE
        // ==================================

        case "mc_home":

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