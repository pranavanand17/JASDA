// ==========================================
// SCENE 6
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

vn_controller.scene_manager = id;


// ==========================================
// BACKGROUND
// ==========================================

current_background = spr_classroom_bg;


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
// DIALOGUE CALLBACK
// ==========================================

function dialogue_finished()
{
    switch(dialogue_stage)
    {
        // ======================================
        // INTRO
        // ======================================

        case "intro":

            dialogue_stage = "roof";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "I was eating lunch on the school roof."
            );

        break;


        // ======================================
        // ROOF
        // ======================================

        case "roof":

            dialogue_stage = "lame";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "Damn... that's lame."
            );

        break;


        // ======================================
        // ...
        // ======================================

        case "lame":

            dialogue_stage = "ellipsis1";

            vn_controller.start_dialogue(
                "Felix",
                "..."
            );

        break;


        // ======================================
        // WALK
        // ======================================

        case "ellipsis1":

            dialogue_stage = "walk";

            vn_controller.start_dialogue(
                "Felix",
                "Anyway dude, I was wondering you walk to school right?"
            );

        break;


        // ======================================
        // YEAH
        // ======================================

        case "walk":

            dialogue_stage = "yeah";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Yeah."
            );

        break;


        // ======================================
        // ALONE
        // ======================================

        case "yeah":

            dialogue_stage = "alone";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "Do you walk alone?"
            );

        break;


        // ======================================
        // AMBER
        // ======================================

        case "alone":

            dialogue_stage = "amber";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Nah, Amber walks with me..."
            );

        break;


        // ======================================
        // WASSUP
        // ======================================

        case "amber":

            dialogue_stage = "wassup";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Wassup?"
            );

        break;


        // ======================================
        // SHY
        // ======================================

        case "wassup":

            dialogue_stage = "shy";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "Nothing's up, I was just wondering..."
            );

        break;


        // ======================================
        // WALK TOGETHER
        // ======================================

        case "shy":

            dialogue_stage = "walk_together";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "You know... because my house is quite close to yours... and maybe we... could walk to school together..."
            );

        break;


        // ======================================
        // OKAY
        // ======================================

        case "walk_together":

            dialogue_stage = "okay";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Okay..."
            );

        break;


        // ======================================
        // ACCOUNTABLE
        // ======================================

        case "okay":

            dialogue_stage = "accountable";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "I'm not tryna be weird... I just want you to hold me accountable for getting to school on time... that's why."
            );

        break;


        // ======================================
        // AMBER 2
        // ======================================

        case "accountable":

            dialogue_stage = "amber2";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Sure... I guess I'll ask Amber if she's okay with it."
            );

        break;


        // ======================================
        // AMBER 2 - SECOND LINE
        // ======================================

        case "amber2":

            dialogue_stage = "amber3";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "I'm always making her late anyway."
            );

        break;


        // ======================================
        // HE HE
        // ======================================

        case "amber3":

            dialogue_stage = "hehe";

            character_manager.set_active_character("Felix");

            vn_controller.start_dialogue(
                "Felix",
                "Of course dude, ask her... I wouldn't want it to be weird or anything... he he."
            );

        break;


        // ======================================
        // ...
        // ======================================

        case "hehe":

            dialogue_stage = "ellipsis2";

            vn_controller.start_dialogue(
                "Felix",
                "..."
            );

        break;


        // ======================================
        // CLUBROOM
        // ======================================

        case "ellipsis2":

            dialogue_stage = "club";

            vn_controller.start_dialogue(
                "Felix",
                "Aight, we gotta go to the clubroom dude... it's time for extracurriculars."
            );

        break;


        // ======================================
        // LET'S GO
        // ======================================

        case "club":

            dialogue_stage = "letsgo";

            character_manager.set_active_character("");

            vn_controller.start_dialogue(
                "{MC}",
                "Sure let's go."
            );

        break;


        // ======================================
        // END
        // ======================================

        case "letsgo":

            dialogue_stage = "end";

            character_manager.hide_character(
                "Felix"
            );

            transition_active = true;
            transition_alpha = 0;

        break;
    }
}