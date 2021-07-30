if (mouse_check_button_pressed(mb_left)) {
	if (soundEnabled && mouse_x >= 0 && mouse_x < 64 && mouse_y >= 150 && mouse_y < 214) {
		soundEnabled = false;
		alarm[3] = 1;
		alarm[4] = 150;
		audio_play_sound(sndBoss1ItemHelp, 0, false);
	}
}