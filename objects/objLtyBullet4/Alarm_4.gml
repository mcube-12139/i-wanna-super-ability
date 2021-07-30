centerX += 9 - 0.45 * time;
event_user(10);
++time;
if (time != 41) {
	alarm[4] = 1;
} else {
	fora cherries arof {
		with (cherries[i]) {
			motion_set(point_direction(other.centerX, other.centerY, x, y), 5);
			enableDestroy = true;
		}
	}
	instance_destroy();
}