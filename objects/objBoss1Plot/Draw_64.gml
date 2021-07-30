if (showPlot) {
	draw_set_alpha(0.8);
	draw_rectangle(0, 0, 800, 150, false);
	if (textEnd && textIndex == 2) {
		draw_rectangle(0, 151, 63, 214, false);
		draw_set_alpha(1);
		draw_sprite_ext(sprSound, soundIndex, 32, 182, 2, 2, 0, c_white, 1);
	}
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_set_font(fSimSum12);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_transformed(16, 16, text, 2, 2, 0);
	draw_set_color(c_black);
}