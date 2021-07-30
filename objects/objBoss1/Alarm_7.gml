if (count < 20) {
	instance_create_layer(count % 2 == 0 ? random(400) : random_range(400, 800), -96, layer, objBoss1Bullet3);
	++count;
	alarm[7] = 15;
} else {
	event_user(0);
}