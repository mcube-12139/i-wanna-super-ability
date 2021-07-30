with (instance_create_layer(x, y, layer, objLtyCherry)) {
	motion_set(random_range(30, 150), random_range(3, 5));
	gravity = 0.2;
	enableDestroy = true;
	bottom = true;
}
alarm[0] = 2;