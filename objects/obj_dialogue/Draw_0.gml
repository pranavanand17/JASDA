var data = get_node(node);

// Semi-transparent dialogue box
draw_set_color(make_color_rgb(0, 0, 0));
draw_set_alpha(0.4);
draw_rectangle(100, 500, 1180, 680, true); // filled box

// Reset alpha immediately
draw_set_alpha(1);

// Text color
draw_set_color(c_white);

// Dialogue text
draw_text(120, 520, current_text);

// Name
draw_text(120, 480, "Jasda");


// Draw choices dynamically
if (state == "choice")
{
    for (var i = 0; i < array_length(data.choices); i++)
    {
        draw_text(120, 580 + (i * 30), string(i+1) + ". " + data.choices[i].text);
    }
}


// Draw typing input
if (state == "input")
{
    draw_text(120, 650, "> " + player_input);
}