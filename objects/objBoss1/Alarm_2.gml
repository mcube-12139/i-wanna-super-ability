var dir;
if (instance_exists(objPlayer)) {
	if (count < 11) {
		dir = point_direction(x, y, objPlayer.x, objPlayer.y) - 30;
		with (instance_create_layer(x, y, layer, objCherry)) {
			image_speed = 0;
			motion_set(dir + 30, 7);
		}
		repeat (5) {
			with (instance_create_layer(x, y, layer, objCherry)) {
				image_speed = 0;
				motion_set(dir, 5);
			}
			dir += 15;
		}
		++count;
		alarm[2] = 25;
	} else {
		event_user(0);
	}
}