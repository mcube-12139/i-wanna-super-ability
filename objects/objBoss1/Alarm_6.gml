if (count < 9) {
	instance_create_layer(912, count % 2 == 0 ? random_range(400, 480): random_range(480, 560), layer, objBoss1Bullet2);
	++count;
	alarm[6] = 50;
} else {
	event_user(0);
}