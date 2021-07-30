image_alpha += 0.05;
if (image_alpha != 1) {
	alarm[0] = 1;
} else {
	audio_sound_gain(musAvoi1, 1, 0);
	scrPlayMusic(musAvoi1, false);
	instance_create_layer(400, 304, "Above_player", objMikuCoin);
	timeline_index = tlAvoi1;
	timeline_running = true;
	alarm[1] = 979;
	alarm[2] = 1129;
}