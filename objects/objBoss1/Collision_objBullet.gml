instance_destroy(other);
if (notHit) {
	--hp;
	if (hp > 0) {
		image_alpha = 0.5;
		notHit = false;
		alarm[4] = 75;
		if (hp < 8 && !triggered) {
			triggered = true;
			instance_create_layer(0, 0, layer, objBoss1Warn);
		}
		audio_play_sound(sndBossHit, 0, false);
	} else {
		inst_rise1.vspeed = 0;
		inst_rise1.y = 416;
		inst_rise2.vspeed = 0;
		inst_rise2.y = 416;
		audio_play_sound(sndDeath, 0, false);
		scrStopMusic();
		with (instance_create_layer(384, 384, layer, objWarp)) {
			roomTo = rWorld1_end;
		}
		instance_destroy();
	}
}