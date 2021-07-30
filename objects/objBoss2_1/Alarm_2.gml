cube_rotate(irandom(2), irandom(2), choose(-9, 9), 10);
audio_play_sound(sndThrow, 0, false);
with (instance_create_layer(x, y, layer, objBoss2GreenCherryBounce)) {
	motion_set(random(360), 3);
}
with (instance_create_layer(x, y, layer, objBoss2GreenGoomba)) {
	motion_set(random(360), 3);
	onStamp = function () {
		if (instance_number(objBoss2GreenGoomba) == 1) {
			instance_destroy(objBoss2GreenCherryBounce);
			with (objBoss2_1) {
				alarm[3] = 50;
			}
		}
	};
}
if (++throwCount != 6) {
	alarm[2] = 25;
}