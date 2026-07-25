draw_set_font(fnt_dialogue);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_white);

draw_text(
    display_get_gui_width()/2,
    250,
    "Enter your name"
);

var txt = input_text;

if (cursor_show)
{
    txt += "_";
}

draw_text(
    display_get_gui_width()/2,
    400,
    txt
);

draw_text(
    display_get_gui_width()/2,
    520,
    "Press ENTER to continue"
);

draw_set_font(-1);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);