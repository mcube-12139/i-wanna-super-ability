image_alpha -= 0.05;
if (image_alpha != 0) {
	alarm[2] = 1;
} else {
	instance_destroy(inst_avoiExit);
	audio_play_sound(sndBlockChange, 0, false);
	instance_destroy();
}