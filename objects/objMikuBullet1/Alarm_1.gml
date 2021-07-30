fora cherries arof {
	with (cherries[i]) {
		speed = 16;
		direction = other.cherryDirs[i];
	}
}
++count2;
var r = random(360);
repeat (25) {
	with (instance_create_layer(400, 304, layer, objMikuCherry)) {
		speed = 12;
		direction = r;
	}
	r += 14.4;
}
alarm[2] = 13;