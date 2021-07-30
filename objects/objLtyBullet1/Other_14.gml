fora cherries arof {
	with (cherries[i]) {
		enableDestroy = true;
		motion_set(random(360), random_range(4, 8));
	}
}
instance_destroy();