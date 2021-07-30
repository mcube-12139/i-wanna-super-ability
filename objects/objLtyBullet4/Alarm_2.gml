centerY += 12 - 0.6 * time;
event_user(10);
++time;
if (time != 41) {
	alarm[2] = 1;
} else {
	fora cherries arof {
		with (cherries[i]) {
			motion_set(point_direction(other.centerX, other.centerY, x, y), 5);
			enableDestroy = true;
		}
	}
	instance_destroy();
}