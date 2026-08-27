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
    !dialogue_started &&
    vn_controller != noone
)
{
    dialogue_started = true;

    dialogue_stage = "intro";

    vn_controller.start_dialogue(
        "Felix",
        "Dude I'm bored as hell!"
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
        // FELIX - BORED
        // ==========================================

        case "intro":

            dialogue_stage = "felix_gym";

            vn_controller.start_dialogue(
                "Felix",
                "We gotta sign up to a gym or something!"
            );

        break;


        // ==========================================
        // MC - SCHOOL
        // ==========================================

        case "felix_gym":

            dialogue_stage = "mc_school";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "We can't do that right now."
            );

        break;


        case "mc_school":

            dialogue_stage = "mc_stuck";

            vn_controller.start_dialogue(
                "{MC}",
                "We're stuck here until school is over."
            );

        break;


        // ==========================================
        // FELIX - AMBER
        // ==========================================

        case "mc_stuck":

            dialogue_stage = "felix_ugh";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Ugh!"
            );

        break;


        case "felix_ugh":

            dialogue_stage = "felix_pause1";

            vn_controller.start_dialogue(
                "Felix",
                "..."
            );

        break;


        case "felix_pause1":

            dialogue_stage = "felix_tell";

            vn_controller.start_dialogue(
                "Felix",
                "Tell you what."
            );

        break;


        case "felix_tell":

            dialogue_stage = "felix_amber";

            vn_controller.start_dialogue(
                "Felix",
                "Let's go see what Amber is doing."
            );

        break;


        // ==========================================
        // MC - WHY
        // ==========================================

        case "felix_amber":

            dialogue_stage = "mc_amber";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Amber?"
            );

        break;


        case "mc_amber":

            dialogue_stage = "mc_why";

            vn_controller.start_dialogue(
                "{MC}",
                "Why?"
            );

        break;


        // ==========================================
        // FELIX - TALK TO AMBER
        // ==========================================

        case "mc_why":

            dialogue_stage = "felix_talk";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "'Cos I wanna talk to her dude!"
            );

        break;


        case "felix_talk":

            dialogue_stage = "felix_coming";

            vn_controller.start_dialogue(
                "Felix",
                "You coming?"
            );

        break;


        // ==========================================
        // MC - NO CHOICE
        // ==========================================

        case "felix_coming":

            dialogue_stage = "mc_no_choice";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "What choice do I have..."
            );

        break;


        // ==========================================
        // FELIX - HEY AMBER
        // ==========================================

        case "mc_no_choice":

            dialogue_stage = "felix_hey_amber";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Hey Amber!"
            );

        break;


        // ==========================================
        // AMBER ENTERS
        // ==========================================

        case "felix_hey_amber":

            dialogue_stage = "amber_wassup";

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
                "Yeah wassup"
            );

        break;


        // ==========================================
        // FELIX - OCCULT
        // ==========================================

        case "amber_wassup":

            dialogue_stage = "felix_occult";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "{MC}'s name and I were wondering what goes on in the occult club..."
            );

        break;


        // ==========================================
        // AMBER - PARANORMAL
        // ==========================================

        case "felix_occult":

            dialogue_stage = "amber_paranormal1";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Oh it's nothing much."
            );

        break;


        case "amber_paranormal1":

            dialogue_stage = "amber_paranormal2";

            vn_controller.start_dialogue(
                "Amber",
                "We just document paranormal activity around the town..."
            );

        break;


        case "amber_paranormal2":

            dialogue_stage = "amber_caves";

            vn_controller.start_dialogue(
                "Amber",
                "well not really around town either, it's mostly just about those caves around town."
            );

        break;


        // ==========================================
        // FELIX - CAVES
        // ==========================================

        case "amber_caves":

            dialogue_stage = "felix_sick";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "That's so sick!"
            );

        break;


        case "felix_sick":

            dialogue_stage = "felix_check_caves";

            vn_controller.start_dialogue(
                "Felix",
                "I've been meaning to check those caves out myself."
            );

        break;


        case "felix_check_caves":

            dialogue_stage = "felix_pause2";

            vn_controller.start_dialogue(
                "Felix",
                "..."
            );

        break;


        case "felix_pause2":

            dialogue_stage = "felix_join";

            vn_controller.start_dialogue(
                "Felix",
                "Dude, maybe we should join."
            );

        break;


        // ==========================================
        // AMBER - NO JOIN
        // ==========================================

        case "felix_join":

            dialogue_stage = "amber_no";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "No thanks."
            );

        break;


        case "amber_no":

            dialogue_stage = "amber_girls";

            vn_controller.start_dialogue(
                "Amber",
                "It's an all girls club."
            );

        break;


        case "amber_girls":

            dialogue_stage = "amber_documentation";

            vn_controller.start_dialogue(
                "Amber",
                "A single guy would ruin the vibes and I doubt you'll be any good at documentation anyways."
            );

        break;


// ==========================================
// FELIX - MISSING PEOPLE
// ==========================================

case "amber_documentation":

    dialogue_stage = "felix_aw";

    character_manager.set_active_character(
        "Felix"
    );

    vn_controller.start_dialogue(
        "Felix",
        "Aw man!"
    );

break;


case "felix_aw":

    dialogue_stage = "felix_sucks";

    vn_controller.start_dialogue(
        "Felix",
        "That sucks..."
    );

break;


case "felix_sucks":

    dialogue_stage = "felix_knowledge";

    vn_controller.start_dialogue(
        "Felix",
        "But I'm like super knowledgeable about all that stuff tho."
    );

break;


// ==========================================
// FELIX - MISSING PEOPLE
// ==========================================

case "felix_knowledge":

    dialogue_stage = "felix_missing";

    vn_controller.start_dialogue(
        "Felix",
        "I know a bunch about people going missing in town a few years back."
    );

break;


// ==========================================
// FELIX - PARANORMAL ACTIVITY
// ==========================================

case "felix_missing":

    dialogue_stage = "felix_paranormal";

    vn_controller.start_dialogue(
        "Felix",
        "And I like Paranormal Activity, you know, the movie."
    );

break;


// ==========================================
// AMBER - MISSING
// ==========================================

case "felix_paranormal":

    dialogue_stage = "amber_missing";

    character_manager.set_active_character(
        "Amber"
    );

    vn_controller.start_dialogue(
        "Amber",
        "People going missing is not paranormal, that happens everywhere."
    );

break;


// ==========================================
// MC - CAVES
// ==========================================

case "amber_missing":

    dialogue_stage = "mc_caves";

    character_manager.set_active_character("");

    vn_controller.start_dialogue(
        "{MC}",
        "Well what's so paranormal about those caves then?"
    );

break;

        


        // ==========================================
        // AMBER - CRYING
        // ==========================================

        case "mc_caves":

            dialogue_stage = "amber_crying";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "How don't you know about the crying noises from the caves?"
            );

        break;


        case "amber_crying":

            dialogue_stage = "amber_inattentive";

            vn_controller.start_dialogue(
                "Amber",
                "You've lived here like your whole life, are you really this inattentive?"
            );

        break;


        // ==========================================
        // MC - ANIMALS
        // ==========================================

        case "amber_inattentive":

            dialogue_stage = "mc_animals";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "I've heard the noises."
            );

        break;


        case "mc_animals":

            dialogue_stage = "mc_bobcats";

            vn_controller.start_dialogue(
                "{MC}",
                "But aren't they just animal noises, like bobcats or foxes... that's what everyone in town says they are."
            );

        break;


        // ==========================================
        // FELIX - FOXES
        // ==========================================

        case "mc_bobcats":

            dialogue_stage = "felix_foxes";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Foxes? I've never seen one of those in real life before."
            );

        break;


        // ==========================================
        // AMBER - NO FOXES
        // ==========================================

        case "felix_foxes":

            dialogue_stage = "amber_idiots";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Listen, you complete idiots."
            );

        break;


        case "amber_idiots":

            dialogue_stage = "amber_no_animals";

            vn_controller.start_dialogue(
                "Amber",
                "There's no way you could have heard a fox or a bobcat."
            );

        break;


        case "amber_no_animals":

            dialogue_stage = "amber_none";

            vn_controller.start_dialogue(
                "Amber",
                "Because there are no foxes or bobcats here!"
            );

        break;


        // ==========================================
        // FELIX - IDEA
        // ==========================================

        case "amber_none":

            dialogue_stage = "felix_right";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Yeah dude she's right."
            );

        break;


        case "felix_right":

            dialogue_stage = "felix_song";

            vn_controller.start_dialogue(
                "Felix",
                "Plus ain't no one ever heard what a fox says, you know, like that one song."
            );

        break;


        case "felix_song":

            dialogue_stage = "felix_idea_pause";

            vn_controller.start_dialogue(
                "Felix",
                "..."
            );

        break;


        case "felix_idea_pause":

            dialogue_stage = "felix_idea";

            vn_controller.start_dialogue(
                "Felix",
                "Hey I got an idea!"
            );

        break;


        case "felix_idea":

            dialogue_stage = "felix_caves_plan";

            vn_controller.start_dialogue(
                "Felix",
                "Maybe we should go check out those caves after the film this weekend."
            );

        break;


        case "felix_caves_plan":

            dialogue_stage = "felix_adventure";

            vn_controller.start_dialogue(
                "Felix",
                "It'll be a fun adventure."
            );

        break;


        case "felix_adventure":

            dialogue_stage = "felix_jasda_plan";

            vn_controller.start_dialogue(
                "Felix",
                "Maybe {MC}'s name can bring Jasda along with him."
            );

        break;


        // ==========================================
        // JASDA ENTERS
        // ==========================================

        case "felix_jasda_plan":

            dialogue_stage = "anonymous_where";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "Anonymous",
                "Bring me where?"
            );

        break;


        case "anonymous_where":

            dialogue_stage = "mc_movie";

            character_manager.show_character(
                character_manager.jasda,
                "left"
            );

            character_manager.set_active_character("");

            character_manager.change_expression(
                character_manager.jasda,
                "default"
            );

            vn_controller.start_dialogue(
                "{MC}",
                "Oh yeah so..."
            );

        break;


        case "mc_movie":

            dialogue_stage = "mc_movie_invite";

            vn_controller.start_dialogue(
                "{MC}",
                "Me & my friends were wondering... if you would like to go out to a movie this weekend..."
            );

        break;


        // ==========================================
        // JASDA - MOVIE
        // ==========================================

        case "mc_movie_invite":

            dialogue_stage = "jasda_movie";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "A movie?"
            );

        break;


        case "jasda_movie":

            dialogue_stage = "jasda_great";

            vn_controller.start_dialogue(
                "Jasda",
                "That sounds great!"
            );

        break;


        case "jasda_great":

            dialogue_stage = "jasda_pause";

            vn_controller.start_dialogue(
                "Jasda",
                "..."
            );

        break;


        case "jasda_pause":

            dialogue_stage = "jasda_horror";

            vn_controller.start_dialogue(
                "Jasda",
                "I've been meaning to check out that new horror film."
            );

        break;


        // ==========================================
        // FELIX - REGRESSION
        // ==========================================

        case "jasda_horror":

            dialogue_stage = "felix_regression1";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Oh yes!"
            );

        break;


        case "felix_regression1":

            dialogue_stage = "felix_regression2";

            vn_controller.start_dialogue(
                "Felix",
                "That's what me and {MC}'s name were talking about a few days ago."
            );

        break;


        case "felix_regression2":

            dialogue_stage = "felix_what_called";

            vn_controller.start_dialogue(
                "Felix",
                "What's it called?"
            );

        break;


        case "felix_what_called":

            dialogue_stage = "felix_regression";

            vn_controller.start_dialogue(
                "Felix",
                "Regression or something."
            );

        break;


        // ==========================================
        // AMBER - OBSESSION
        // ==========================================

        case "felix_regression":

            dialogue_stage = "amber_obsession";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "I think it's called Obsession."
            );

        break;


        // ==========================================
        // FELIX - THAT'S IT
        // ==========================================

        case "amber_obsession":

            dialogue_stage = "felix_thats_it";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Yeah, that's what I said."
            );

        break;


        // ==========================================
        // JASDA - SATURDAY
        // ==========================================

        case "felix_thats_it":

            dialogue_stage = "jasda_saturday";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Great!"
            );

        break;


        case "jasda_saturday":

            dialogue_stage = "jasda_saturday_pause";

            vn_controller.start_dialogue(
                "Jasda",
                "..."
            );

        break;


        case "jasda_saturday_pause":

            dialogue_stage = "jasda_saturday_plan";

            vn_controller.start_dialogue(
                "Jasda",
                "So Obsession on Saturday?"
            );

        break;


        // ==========================================
        // MC - PLAN
        // ==========================================

        case "jasda_saturday_plan":

            dialogue_stage = "mc_plan";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Sounds like a plan."
            );

        break;


        // ==========================================
        // FELIX - GOODBYE
        // ==========================================

        case "mc_plan":

            dialogue_stage = "felix_goodbye";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "See you guys tomorrow then."
            );

        break;


        case "felix_goodbye":

            dialogue_stage = "felix_bye";

            vn_controller.start_dialogue(
                "Felix",
                "Bye!"
            );

        break;


        // ==========================================
        // JASDA - BYE
        // ==========================================

        case "felix_bye":

            dialogue_stage = "jasda_goodbye";

            character_manager.hide_character(
                "Felix"
            );

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Bye!"
            );

        break;


        // ==========================================
        // AMBER - GOODBYE
        // ==========================================

        case "jasda_goodbye":

            dialogue_stage = "amber_goodbye";

            character_manager.hide_character(
                "Jasda"
            );

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Bye guys!"
            );

        break;


        case "amber_goodbye":

            dialogue_stage = "amber_lets_go";

            vn_controller.start_dialogue(
                "Amber",
                "Let's go?"
            );

        break;


        // ==========================================
        // MC - LET'S
        // ==========================================

        case "amber_lets_go":

            dialogue_stage = "mc_lets_go";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Let's."
            );

        break;


        // ==========================================
        // END
        // ==========================================

        case "mc_lets_go":

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
        // Next scene can be added later.
    }
}