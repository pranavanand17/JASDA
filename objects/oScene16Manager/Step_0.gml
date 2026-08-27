// ==========================================
// FIND VN CONTROLLER
// ==========================================

if (vn_controller == noone)
{
    vn_controller = instance_find(
        oVNController,
        0
    );

    if (vn_controller != noone)
    {
        vn_controller.scene_manager = id;
    }
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
    !dialogue_started &&
    vn_controller != noone
)
{
    dialogue_started = true;

    dialogue_stage = "intro";

    vn_controller.start_dialogue(
        "Felix",
        "I'm telling you dude you gotta step out more man"
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
        // FELIX
        // ==========================================

        case "intro":

            dialogue_stage = "mc_step_out";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "I think I step out enough"
            );

        break;


        // ==========================================
        // MC
        // ==========================================

        case "mc_step_out":

            dialogue_stage = "felix_grass";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "Nah bro, you ain't been touching no grass man"
            );

        break;


        case "felix_grass":

            dialogue_stage = "felix_shut_in";

            vn_controller.start_dialogue(
                "Felix",
                "How you gonna get that girl when you's a shut in?"
            );

        break;


        // ==========================================
        // WHICH GIRL
        // ==========================================

        case "felix_shut_in":

            dialogue_stage = "mc_which_girl";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Which girl?"
            );

        break;


        // ==========================================
        // FELIX - ANGRY
        // ==========================================

        case "mc_which_girl":

            dialogue_stage = "felix_beat";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "Man, I swear to god. I'm about to beat the shit outta you."
            );

        break;


        case "felix_beat":

            dialogue_stage = "felix_nonchalant";

            vn_controller.start_dialogue(
                "Felix",
                "Stop trying to be nonchalant with me bitch."
            );

        break;


        case "felix_nonchalant":

            dialogue_stage = "felix_jasda";

            vn_controller.start_dialogue(
                "Felix",
                "Jasda!"
            );

        break;


        case "felix_jasda":

            dialogue_stage = "mc_likes_jasda";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "Felix",
                "You like her don't you?"
            );

        break;


        // ==========================================
        // MC - YES
        // ==========================================

        case "mc_likes_jasda":

            dialogue_stage = "felix_girls_shutins";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Yes"
            );

        break;


        // ==========================================
        // FELIX
        // ==========================================

        case "felix_girls_shutins":

            dialogue_stage = "mc_how_know";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "Yeah dude, girls don't like shut-ins."
            );

        break;


        // ==========================================
        // MC
        // ==========================================

        case "mc_how_know":

            dialogue_stage = "mc_never";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "How would you know what girls like?"
            );

        break;


        case "mc_never":

            dialogue_stage = "felix_instinct";

            vn_controller.start_dialogue(
                "{MC}",
                "You've never been with one yourself."
            );

        break;


        // ==========================================
        // INSTINCT
        // ==========================================

        case "felix_instinct":

            dialogue_stage = "mc_some_instinct";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "It's an instinct dude"
            );

        break;


        case "mc_some_instinct":

            dialogue_stage = "felix_tell_you";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Some instinct."
            );

        break;


        // ==========================================
        // MR LEON
        // ==========================================

        case "felix_tell_you":

            dialogue_stage = "felix_leon";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "Tell you what man."
            );

        break;


        case "felix_leon":

            dialogue_stage = "mc_gym_teacher";

            vn_controller.start_dialogue(
                "Felix",
                "I've heard all the girls in our grade have a thing for Mr. Leon."
            );

        break;


        case "mc_gym_teacher":

            dialogue_stage = "felix_charismatic";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "The gym teacher?"
            );

        break;


        case "felix_charismatic":

            dialogue_stage = "mc_what_about";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "Yeah dude, he's charismatic as fuck."
            );

        break;


        case "mc_what_about":

            dialogue_stage = "felix_how_about";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "What about it?"
            );

        break;


        // ==========================================
        // ASK LEON
        // ==========================================

        case "felix_how_about":

            dialogue_stage = "felix_gym_advice";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "How 'bout tomorrow during gym class we ask him for advice on how to get girls."
            );

        break;


        case "felix_gym_advice":

            dialogue_stage = "mc_bad_idea";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "I don't know if that's such a good idea."
            );

        break;


        case "mc_bad_idea":

            dialogue_stage = "felix_it_is";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "It is dude!"
            );

        break;


        case "felix_it_is":

            dialogue_stage = "felix_down";

            vn_controller.start_dialogue(
                "Felix",
                "You down or what?"
            );

        break;


        case "felix_down":

            dialogue_stage = "mc_sure";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Sure, whatever..."
            );

        break;


        // ==========================================
        // THE DEAL
        // ==========================================

        case "mc_sure":

            dialogue_stage = "felix_talking";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "That's what I'm talking about."
            );

        break;


        case "felix_talking":

            dialogue_stage = "felix_amber";

            vn_controller.start_dialogue(
                "Felix",
                "You help me get Amber."
            );

        break;


        case "felix_amber":

            dialogue_stage = "felix_jasda_help";

            vn_controller.start_dialogue(
                "Felix",
                "And I'll help you get Jasda."
            );

        break;


        case "felix_jasda_help":

            dialogue_stage = "felix_deal";

            vn_controller.start_dialogue(
                "Felix",
                "Deal?"
            );

        break;


        case "felix_deal":

            dialogue_stage = "amber_enters";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Deal."
            );

        break;


        // ==========================================
        // AMBER ENTERS
        // ==========================================

        case "amber_enters":

            dialogue_stage = "mc_nothing";

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


        case "mc_nothing":

            dialogue_stage = "felix_movie";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Nothing..."
            );

        break;


        // ==========================================
        // MOVIE
        // ==========================================

        case "felix_movie":

            dialogue_stage = "mc_movie";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "We was talking about... that new horror movie that's out... Weren't we {MC}?"
            );

        break;


        case "mc_movie":

            dialogue_stage = "mc_movie_dots";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Yeah yeah, the movie yeah."
            );

        break;


        case "mc_movie_dots":

            dialogue_stage = "mc_movie_wait";

            vn_controller.start_dialogue(
                "{MC}",
                "..."
            );

        break;


        case "mc_movie_wait":

            dialogue_stage = "amber_weird";

            vn_controller.start_dialogue(
                "{MC}",
                "Can't wait to check it out."
            );

        break;


        // ==========================================
        // AMBER
        // ==========================================

        case "amber_weird":

            dialogue_stage = "amber_come";

            character_manager.set_active_character("Amber");

            vn_controller.start_dialogue(
                "Amber",
                "Weird."
            );

        break;


        case "amber_come":

            dialogue_stage = "felix_you_will";

            vn_controller.start_dialogue(
                "Amber",
                "Well I'll come with."
            );

        break;


        case "felix_you_will":

            dialogue_stage = "amber_sure";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "YOU WILL?"
            );

        break;


        case "amber_sure":

            dialogue_stage = "amber_weekend";

            character_manager.set_active_character("Amber");

            vn_controller.start_dialogue(
                "Amber",
                "Yeah sure."
            );

        break;


        case "amber_weekend":

            dialogue_stage = "felix_awesome";

            vn_controller.start_dialogue(
                "Amber",
                "I've been meaning to get out of the house this weekend anyway."
            );

        break;


        case "felix_awesome":

            dialogue_stage = "felix_manlier";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "Awesome!"
            );

        break;


        case "felix_manlier":

            dialogue_stage = "amber_merrier";

            vn_controller.start_dialogue(
                "Felix",
                "The more the manlier."
            );

        break;


        case "amber_merrier":

            dialogue_stage = "felix_merrier";

            character_manager.set_active_character("Amber");

            vn_controller.start_dialogue(
                "Amber",
                "..."
            );

        break;


        case "felix_merrier":

            dialogue_stage = "felix_correction";

            vn_controller.start_dialogue(
                "Amber",
                "I think you mean merrier."
            );

        break;


        case "felix_correction":

            dialogue_stage = "felix_jasda_idea";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "That's what I said."
            );

        break;


        case "felix_jasda_idea":

            dialogue_stage = "felix_jasda_dude";

            vn_controller.start_dialogue(
                "Felix",
                "..."
            );

        break;


        case "felix_jasda_dude":

            dialogue_stage = "mc_jasda";

            vn_controller.start_dialogue(
                "Felix",
                "Dude, shouldn't you ask Jasda to come along as well?"
            );

        break;


        // ==========================================
        // JASDA
        // ==========================================

        case "mc_jasda":

            dialogue_stage = "felix_new_places";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Jasda?"
            );

        break;


        case "felix_new_places":

            dialogue_stage = "amber_new_girl";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "Yeah, she'd get to see some new places around town."
            );

        break;


        case "amber_new_girl":

            dialogue_stage = "felix_ask_jasda";

            character_manager.set_active_character("Amber");

            vn_controller.start_dialogue(
                "Amber",
                "The new girl?"
            );

        break;


        case "felix_ask_jasda":

            dialogue_stage = "mc_ask_jasda";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "Yeah dude, you should totally ask her to join us."
            );

        break;


        case "mc_ask_jasda":

            dialogue_stage = "mc_ask_dots";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "..."
            );

        break;


        case "mc_ask_dots":

            dialogue_stage = "mc_ask_sure";

            vn_controller.start_dialogue(
                "{MC}",
                "Sure, I'll ask her."
            );

        break;


        case "mc_ask_sure":

            dialogue_stage = "mc_ask_amber";

            vn_controller.start_dialogue(
                "{MC}",
                "She was telling me she wanted to get to know Amber as well."
            );

        break;


        case "mc_ask_amber":

            dialogue_stage = "mc_two_birds";

            vn_controller.start_dialogue(
                "{MC}",
                "So I guess we could kill two birds with one stone."
            );

        break;


        // ==========================================
        // AMBER - GET TO KNOW ME
        // ==========================================

        case "mc_two_birds":

            dialogue_stage = "amber_get_to_know";

            character_manager.set_active_character("Amber");

            character_manager.change_expression(
                character_manager.amber,
                "proud_shy"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Get to know me?"
            );

        break;


        case "amber_get_to_know":

            dialogue_stage = "amber_why";

            vn_controller.start_dialogue(
                "Amber",
                "Why?"
            );

        break;


        case "amber_why":

            dialogue_stage = "mc_girl_talk";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Girl talk or something, I don't know."
            );

        break;


        case "mc_girl_talk":

            dialogue_stage = "amber_cool";

            character_manager.set_active_character("Amber");

            vn_controller.start_dialogue(
                "Amber",
                "Sometimes I forget how cool I am."
            );

        break;


        case "amber_cool":

            dialogue_stage = "mc_not_that";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "I don't think it has anything to do with that."
            );

        break;


        // ==========================================
        // AMBER ALLOW
        // ==========================================

        case "mc_not_that":

            dialogue_stage = "amber_allow";

            character_manager.set_active_character("Amber");

            vn_controller.start_dialogue(
                "Amber",
                "Sure you can bring her."
            );

        break;


        case "amber_allow":

            dialogue_stage = "amber_allow_pause";

            vn_controller.start_dialogue(
                "Amber",
                "I'll allow it."
            );

        break;


        case "amber_allow_pause":

            dialogue_stage = "mc_permission";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "No one asked you for permission."
            );

        break;


        case "mc_permission":

            dialogue_stage = "mc_permission_dots";

            vn_controller.start_dialogue(
                "{MC}",
                "..."
            );

        break;


        case "mc_permission_dots":

            dialogue_stage = "mc_ask_again";

            vn_controller.start_dialogue(
                "{MC}",
                "But sure, I'll ask her."
            );

        break;


        // ==========================================
        // FELIX LEAVES
        // ==========================================

        case "mc_ask_again":

            dialogue_stage = "felix_bounce";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "Aight dude, I gotta bounce."
            );

        break;


        case "felix_bounce":

            dialogue_stage = "felix_mom";

            vn_controller.start_dialogue(
                "Felix",
                "Gotta drop my mom off at dance practice."
            );

        break;


        case "felix_mom":

            dialogue_stage = "amber_license";

            character_manager.set_active_character("Amber");

            vn_controller.start_dialogue(
                "Amber",
                "You have a license?"
            );

        break;


        case "amber_license":

            dialogue_stage = "felix_license";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "Yeah"
            );

        break;


        case "felix_license":

            dialogue_stage = "amber_cool_dude";

            character_manager.set_active_character("Amber");

            character_manager.change_expression(
                character_manager.amber,
                "shy"
            );

            vn_controller.start_dialogue(
                "Amber",
                "That's cool... dude."
            );

        break;


        // ==========================================
        // GOODBYE
        // ==========================================

        case "amber_cool_dude":

            dialogue_stage = "mc_see_ya";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "See ya man."
            );

        break;


        case "mc_see_ya":

            dialogue_stage = "felix_bye";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "Bye dudes!"
            );

        break;


        case "felix_bye":

            dialogue_stage = "felix_tomorrow";

            vn_controller.start_dialogue(
                "Felix",
                "See ya tomorrow in gym class {MC}"
            );

        break;


        case "felix_tomorrow":

            dialogue_stage = "felix_wink";

            vn_controller.start_dialogue(
                "Felix",
                "(winks)"
            );

        break;


        // ==========================================
        // AMBER - HOME
        // ==========================================

        case "felix_wink":

            dialogue_stage = "amber_home";

            character_manager.hide_character(
                "Felix"
            );

            character_manager.set_active_character("Amber");

            vn_controller.start_dialogue(
                "Amber",
                "You ready to head home?"
            );

        break;


        case "amber_home":

            dialogue_stage = "mc_home";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Sure."
            );

        break;


        // ==========================================
        // END
        // ==========================================

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

        // Keep the screen black.
        // Next scene can be added here later.
    }
}