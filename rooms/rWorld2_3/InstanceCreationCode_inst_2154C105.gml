onTrigger = function () {
	with (inst_cherryBomb) {
		var i;
		for (i = 0; i != 360; i += 3) {
			with (instance_create_layer(x, y, layer, objCherry)) {
				image_speed = 0;
				motion_set(i, 12);
			}
		}
		instance_destroy();
	}
};
vspeed = 1;