var i;
var j;
var arr;

for (i = 0; i < array_length(indices); ++i) {
	arr = indices[i];
	for (j = 0; j < array_length(arr); ++j) {
		draw_sprite_ext(sprite_index, arr[j], x + i * singleWidth, y + j * singleHeight, scale, scale, image_angle, image_blend, image_alpha);
	}
}