// cherry fall

for (var i = 0; i <= 608; i += 608) {
	for (var j = 0; j != 224; j += 32) {
		with (instance_create_layer(i + j, 0, layer, objCherry)) {
			image_speed = 0;
			sprite_index = sprGreenCherry;
			vspeed = 3;
		}
	}
}

alarm[5] = 100;