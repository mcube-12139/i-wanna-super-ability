fora cherries arof {
	with (cherries[i]) {
		x += 3;
	}
}
x += 3;
if (x >= 960) {
	fora cherries arof {
		instance_destroy(cherries[i]);
	}
	instance_destroy();
}