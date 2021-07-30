if (!point_in_rectangle(x, y, 0, 0, 800, 608) && enableDestroy) {
	if (!bottom || y >= 608) {
		instance_destroy();
	}
}