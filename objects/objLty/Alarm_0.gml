hspeed = 0;
x = 768;
audio_sound_gain(musAvoi2, 0, 0);
scrPlayMusic(musAvoi2, false);
audio_sound_gain(musAvoi2, 1, 1000);
if (instance_exists(objPlayer)) {
	global.secretItem[0] = true;
	global.saveSecretItem[0] = true;
	scrSaveGame(false);
	timeline_index = tlAvoi2;
	timeline_running = true;
}
alarm[1] = 2364;