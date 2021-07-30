// go down

++goDownTime;
y = 128 + 9.386666666666667 * goDownTime - 0.06257777777777777 * goDownTime * goDownTime;
if (goDownAttackType == 0) {
	if (goDownTime % 3 == 0) {
		with (instance_create_layer(x, y, layer, objCherry)) {
			visible = false;
			image_speed = 0;
			sprite_index = choose(sprRedCherry, sprCherry, sprGreenCherry, sprGreenCherry);
			motion_set(random(360), 3);
		}
	}
} else {
	if (goDownTime % 50 == 0) {
		instance_create_layer(x, y, layer, objBoss2CircleControl);
	}
}
if (goDownTime == 150) {
	y = 128;
	goDownTime = 0;
}
alarm[4] = 1;