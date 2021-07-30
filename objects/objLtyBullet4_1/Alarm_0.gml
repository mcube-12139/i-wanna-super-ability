repeat (20) {
	with (instance_create_layer(x, y, layer, objLtyCherry)) {
		motion_set(random(360), random_range(2, 10));
		enableDestroy = true;
	}
}
instance_destroy();