if (left) {
	with (instance_create_layer(0, random_range(70, 538), layer, objLtyCherry)) {
		motion_set(random_range(-20, 20), 5);
		enableDestroy = true;
	}
} else {
	with (instance_create_layer(800, random_range(70, 538), layer, objLtyCherry)) {
		motion_set(random_range(160, 200), 5);
		enableDestroy = true;
	}
}
left = !left;
alarm[0] = 5;