var theta1 = (count + theta) mod 72;
if (theta1 < 36) {
	theta1 = 72 - theta1;
}

with (instance_create_layer(x, y, layer, objMikuCherry)) {
	motion_set(other.count, 3 / dcos(theta1));
}
count += 6;
if (count == 360) {
	count = 0;
	theta += 12;
}
alarm[0] = 1;