// ==========================================
// SCENE 1_1 MANAGER
// ==========================================


// ==========================================
// FIND VN CONTROLLER
// ==========================================

vn_controller = instance_find(
    oVNController,
    0
);


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

dialogue_started = false;
dialogue_has_been_active = false;


// ==========================================
// SCENE END
// ==========================================

scene_ending = false;

end_fade_alpha = 0;
end_fade_speed = 0.03;