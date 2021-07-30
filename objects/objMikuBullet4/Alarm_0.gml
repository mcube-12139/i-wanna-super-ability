repeat (2) {
	with (instance_create_layer(x, y, layer, objMikuCherry)) {
		motion_set(random(360), random_range(12, 16));
	}
}
alarm[0] = 1;