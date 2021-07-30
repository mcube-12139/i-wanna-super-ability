var c;
var w;
var i;
var j;
var arr;

if (!textEnd) {
	textEnd = true;
	alarm[2] = -1;
	while (charIndex <= textLength) {
		c = string_char_at(fullText, charIndex);
		++charIndex;
		w = 2 * string_width(c);
		if (width + w > 768) {
			text += "\n";
			width = w;
		} else {
			width += w;
		}
		text += c;
	}
} else {
	textEnd = false;
	++textIndex;
	if (textIndex != textCount) {
		text = "";
		fullText = texts[textIndex];
		width = 0;
		charIndex = 1;
		textLength = string_length(fullText);
		alarm[2] = 3;
	} else {
		objPlayer.frozen = false;
		with (inst_destroyAfterPlot) {
			for (i = 0; i != image_xscale; ++i) {
				arr = indices[i];
				for (j = 0; j != image_yscale; ++j) {
					with (instance_create_layer(x + 32 * i, y + 32 * j, layer, objBlockFake)) {
						sprite_index = other.sprite_index;
						image_index = arr[j];
					}
				}
			}
			instance_destroy();
		}
		instance_destroy();
	}
}