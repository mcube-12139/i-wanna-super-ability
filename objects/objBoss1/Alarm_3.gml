var dir = spiralDir;
repeat (5) {
	with (instance_create_layer(x, y, layer, objCherry)) {
		image_speed = 0;
		motion_set(dir, 5);
	}
	dir += 72;
}
spiralDir += 10;
alarm[3] = 15;