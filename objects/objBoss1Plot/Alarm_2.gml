var c = string_char_at(fullText, charIndex);
var w = 2 * string_width(c);

++charIndex;
audio_play_sound(sndChar, 0, false);

if (width + w > 768) {
	text += "\n";
	width = w;
} else {
	width += w;
}
text += c;

if (charIndex <= textLength) {
	alarm[2] = 3;
} else {
	textEnd = true;
}