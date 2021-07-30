fora cherries arof {
	with (cherries[i]) {
		var dir = other.dirs[i] + other.rotation;
		x = 400 + other.dists[i] * dcos(dir);
		y = 304 - other.dists[i] * dsin(dir);
	}
}