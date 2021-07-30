fora cherries arof {
	rotations[i] += rotateSpeed;
	if (rotations[i] >= 360) {
		rotations[i] -= 360;
	}
	with (cherries[i]) {
		x = other.x + other.dists[i] * dcos(other.rotations[i]);
		y = other.y - other.dists[i] * dsin(other.rotations[i]);
	}
}
rotateSpeed += 0.024;
if (rotateSpeed > 1.2) {
	rotateSpeed = 1.2;
}
alarm[2] = 1;