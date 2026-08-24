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
        "Dude I'm bored as hell!\nWe gotta sign up to a gym or something!"
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
        // FELIX - BORED
        // ==================================

        case "intro":

            dialogue_stage = "mc_school";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "We can't do that right now.\nWe're stuck here until school is over."
            );

        break;


        // ==================================
        // MC - STUCK AT SCHOOL
        // ==================================

        case "mc_school":

            dialogue_stage = "felix_amber";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Ugh!\n...\nTell you what.\nLet's go see what Amber is doing."
            );

        break;


        // ==================================
        // FELIX - SEE AMBER
        // ==================================

        case "felix_amber":

            dialogue_stage = "mc_why";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Amber?\nWhy?"
            );

        break;


        // ==================================
        // MC - WHY
        // ==================================

        case "mc_why":

            dialogue_stage = "felix_talk_amber";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "'Cos I wanna talk to her dude!\nYou coming?"
            );

        break;


        // ==================================
        // FELIX - YOU COMING
        // ==================================

        case "felix_talk_amber":

            dialogue_stage = "mc_no_choice";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "What choice do I have..."
            );

        break;


        // ==================================
        // MC - NO CHOICE
        // ==================================

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


        // ==================================
        // FELIX - HEY AMBER
        // ==================================

        case "felix_hey_amber":

            dialogue_stage = "amber_occult";

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
                "Yeah wassup"
            );

        break;


        // ==================================
        // AMBER - WASSUP
        // ==================================

        case "amber_occult":

            dialogue_stage = "felix_what_occult";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "{MC}'s name and I were wondering what goes on in the occult club..."
            );

        break;


        // ==================================
        // FELIX - OCCULT CLUB
        // ==================================

        case "felix_what_occult":

            dialogue_stage = "amber_paranormal";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Oh it's nothing much.\nWe just document paranormal activity around the town...\nwell not really around town either, it's mostly just about those caves around town."
            );

        break;


        // ==================================
        // AMBER - PARANORMAL
        // ==================================

        case "amber_paranormal":

            dialogue_stage = "felix_caves";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "That's so sick!\nI've been meaning to check those caves out myself.\n...\nDude, maybe we should join."
            );

        break;


        // ==================================
        // FELIX - JOIN CLUB
        // ==================================

        case "felix_caves":

            dialogue_stage = "amber_no_join";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "No thanks.\nIt's an all girls club.\nA single guy would ruin the vibes and I doubt you'll be any good at documentation anyways."
            );

        break;


        // ==================================
        // AMBER - NO JOIN
        // ==================================

        case "amber_no_join":

            dialogue_stage = "felix_missing";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Aw man!\nThat sucks...\nBut I'm like super knowledgeable about all that stuff tho.\nI know a bunch about people going missing in town a few years back and I like paranormal activity, you know, the movie."
            );

        break;


        // ==================================
        // FELIX - PARANORMAL KNOWLEDGE
        // ==================================

        case "felix_missing":

            dialogue_stage = "amber_missing";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "People going missing is not paranormal, that happens everywhere."
            );

        break;


        // ==================================
        // AMBER - MISSING PEOPLE
        // ==================================

        case "amber_missing":

            dialogue_stage = "mc_caves";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Well what's so paranormal about those caves then?"
            );

        break;


        // ==================================
        // MC - CAVES
        // ==================================

        case "mc_caves":

            dialogue_stage = "amber_crying";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "How don't you know about the crying noises from the caves?\nYou've lived here like your whole life, are you really this inattentive?"
            );

        break;


        // ==================================
        // AMBER - CRYING NOISES
        // ==================================

        case "amber_crying":

            dialogue_stage = "mc_animals";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "I've heard the noises.\nBut aren't they just animal noises, like bobcats or foxes... that's what everyone in town says they are."
            );

        break;


        // ==================================
        // MC - ANIMAL NOISES
        // ==================================

        case "mc_animals":

            dialogue_stage = "felix_foxes";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Foxes? I've never seen one of those in real life before."
            );

        break;


        // ==================================
        // FELIX - FOXES
        // ==================================

        case "felix_foxes":

            dialogue_stage = "amber_no_foxes";

            character_manager.set_active_character(
                "Amber"
            );

            vn_controller.start_dialogue(
                "Amber",
                "Listen, you complete idiots.\nThere's no way you could have heard a fox or a bobcat.\nBecause there are no foxes or bobcats here!"
            );

        break;


        // ==================================
        // AMBER - NO FOXES
        // ==================================

        case "amber_no_foxes":

            dialogue_stage = "felix_idea";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Yeah dude she's right.\nPlus ain't no one ever heard what a fox says, you know, like that one song.\n...\nHey I got an idea!\nMaybe we should go check out those caves after the film this weekend.\nIt'll be a fun adventure. Maybe {MC}'s name can bring Jasda along with him."
            );

        break;


        // ==================================
        // FELIX - CAVE IDEA
        // ==================================

        case "felix_idea":

            dialogue_stage = "anonymous_where";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "Anonymous",
                "Bring me where?"
            );

        break;


        // ==================================
        // ANONYMOUS - BRING ME WHERE
        // ==================================

        case "anonymous_where":

            dialogue_stage = "mc_movie_invite";

            // --------------------------------
            // JASDA ENTERS
            // --------------------------------

            character_manager.show_character(
                character_manager.jasda,
                "left"
            );

            character_manager.set_active_character(
                "Jasda"
            );

            character_manager.change_expression(
                character_manager.jasda,
                "default"
            );

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Oh yeah so...\nMe & my friends were wondering... if you would like to go out to a movie this weekend..."
            );

        break;


        // ==================================
        // MC - MOVIE INVITE
        // ==================================

        case "mc_movie_invite":

            dialogue_stage = "jasda_movie";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "A movie?\nThat sounds great!\n...\nI've been meaning to check out that new horror film."
            );

        break;


        // ==================================
        // JASDA - MOVIE
        // ==================================

        case "jasda_movie":

            dialogue_stage = "felix_regression";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "Oh yes!\nThat's what me and {MC}'s name were talking about a few days ago.\nWhat's it called?\nRegression or something."
            );

        break;


        // ==================================
        // FELIX - REGRESSION
        // ==================================

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


        // ==================================
        // AMBER - OBSESSION
        // ==================================

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


        // ==================================
        // FELIX - THAT'S WHAT I SAID
        // ==================================

        case "felix_thats_it":

            dialogue_stage = "jasda_saturday";

            character_manager.set_active_character(
                "Jasda"
            );

            vn_controller.start_dialogue(
                "Jasda",
                "Great!\n...\nSo Obsession on Saturday?"
            );

        break;


        // ==================================
        // JASDA - SATURDAY
        // ==================================

        case "jasda_saturday":

            dialogue_stage = "mc_plan";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Sounds like a plan."
            );

        break;


        // ==================================
        // MC - SOUNDS LIKE A PLAN
        // ==================================

        case "mc_plan":

            dialogue_stage = "felix_goodbye";

            character_manager.set_active_character(
                "Felix"
            );

            vn_controller.start_dialogue(
                "Felix",
                "See you guys tomorrow then.\nBye!"
            );

        break;


        // ==================================
        // FELIX - BYE
        // ==================================

        case "felix_goodbye":

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


        // ==================================
        // JASDA - BYE
        // ==================================

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
                "Bye guys!\nLet's go?"
            );

        break;


        // ==================================
        // AMBER - LET'S GO
        // ==================================

        case "amber_goodbye":

            dialogue_stage = "mc_lets_go";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Let's."
            );

        break;


        // ==================================
        // MC - LET'S
        // ==================================

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

        // Next scene goes here later.
        // Keep the screen black.
    }
}