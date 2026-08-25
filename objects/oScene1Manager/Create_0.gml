// ==========================================
// CHARACTER MANAGER
// ==========================================

char_manager = instance_find(
    oCharacterManager,
    0
);


// ==========================================
// CURRENT SCENE
// ==========================================

current_scene = noone;


// ==========================================
// TABLE SCENE
// ==========================================

scene_table =
{
    background: sTable
};


// ==========================================
// SCENE STATE
// ==========================================

loaded = false;


// ==========================================
// TABLE OBJECTS
// ==========================================

table_objects_spawned = false;

bag_instance = noone;
books_instance = noone;
pencilbox_instance = noone;


// ==========================================
// OBJECT FADE
// ==========================================

bag_alpha = 0;
books_alpha = 0;
pencilbox_alpha = 0;

object_fade_speed = 0.03;


// ==========================================
// OBJECT STATES
// ==========================================

bag_collected = false;
books_collected = false;
pencilbox_collected = false;


// ==========================================
// DIALOGUE
// ==========================================

table_objects_finished = false;
table_dialogue_started = false;

dialogue_delay_active = false;
dialogue_delay_timer = 0;


// ==========================================
// SCENE END
// ==========================================

scene_ending = false;

end_fade_alpha = 0;
end_fade_speed = 0.03;