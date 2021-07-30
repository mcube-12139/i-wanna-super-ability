var scale = 1 + 0.2 * irandom(5);
with (instance_create_layer(random(736), 608, layer, objWater3Destroy)) {
	image_xscale = scale;
	image_yscale = scale;
	vspeed = random_range(-2, -3);
}
with (instance_create_layer(random_range(32, 768), 608, layer, objCherry)) {
	image_xscale = scale;
	image_yscale = scale;
	sprite_index = sprGreenCherry;
	image_speed = 0;
	vspeed = random_range(-2, -3);
}

alarm[11] = 10;