yy = y;
repeat (image_yscale) {
	draw_sprite_ext(sprite_index, image_index, x, yy, 1, 1, 0, image_blend, image_alpha);
	yy += 32;
}