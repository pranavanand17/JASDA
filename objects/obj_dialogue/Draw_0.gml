// Draw dialogue box (semi-transparent)
draw_set_color(make_color_rgb(0, 0, 0));
draw_set_alpha(0.4);
draw_rectangle(100, 500, 1180, 680, false); // smaller height

// Reset alpha immediately
draw_set_alpha(1);

// Draw text
draw_set_color(c_white);
draw_text(120, 520, current_text);

// Name
draw_text(120, 480, "Jasda");

// Choices
if (state == "choice")
{
    draw_text(120, 580, "1. I just wanted to see you.");
    draw_text(120, 610, "2. None of your business.");
}