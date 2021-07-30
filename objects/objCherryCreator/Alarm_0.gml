with (instance_create_layer(random_range(x - 112, x + 112), y, layer, objCherry)) {
	sprite_index = choose(sprRedCherry, sprGreenCherry);
	image_speed = 0;
	vspeed = random_range(3, 6);
}
alarm[0] = time;