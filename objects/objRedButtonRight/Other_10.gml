/// @description Set trigger

if (key == -1 || global.trigger[key]) {
	image_index = 1;
	global.trigger[trg] = true;
	if (snd != -1) {
		audio_play_sound(snd, 0, false);
	}
	onTrigger();
}