var rot;

rot = rotation;
fora cherries arof {
	with (cherries[i]) {
		x = other.centerX + 128 * dcos(rot);
		y = other.centerY - 128 * dsin(rot);
	}
	rot += 11.25;
}