onTrigger = function () {
	inst_greenCherry0.sprite_index = sprRedCherry;
	inst_greenCherry1.sprite_index = sprRedCherry;
	inst_greenCherry2.sprite_index = sprRedCherry;
	audio_play_sound(sndBlockChange, 0, false);
};