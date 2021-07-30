for (var i = 0; i < image_yscale; ++i) {
	for (var j = 0; j < image_xscale; ++j) {
		draw_sprite_ext(sprite_index, image_index, x + 32 * j, y + 32 * i, 1, 1, 0, image_blend, image_alpha);
	}
}