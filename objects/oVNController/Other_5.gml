// ==========================================
// CLEAR DIALOGUE WHEN LEAVING ROOM
// ==========================================

dialogue_active = false;

dialogue = "";
display_text = "";
speaker = "";

text_index = 0;

typing = false;
line_finished = false;

dialogue_pending = false;
dialogue_delay_timer = 0;


// ==========================================
// CLEAR CHOICES
// ==========================================

choice_active = false;

choice_options = [];
choice_count = 0;
selected_choice = -1;