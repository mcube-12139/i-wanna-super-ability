var dir = random(360);
repeat (36) {
	with (instance_create_layer(x, y, layer, objMikuCherry)) {
		speed = 15;
		direction = dir;
	}
	dir += 10;
}