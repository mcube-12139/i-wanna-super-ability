// cherry wall

var sprLeft;
var sprRight;
if (cherryCount == greenIndex) {
	sprLeft = sprGreenCherry;
	sprRight = sprGreenCherry;
} else {
	sprLeft = cherryCount != greenIndexLeft ? sprRedCherry : sprGreenCherry;
	sprRight = cherryCount != greenIndexRight ? sprRedCherry : sprGreenCherry;
}
with (instance_create_layer(16, 432 - 32 * cherryCount, layer, objCherry)) {
	visible = false;
	image_speed = 0;
	sprite_index = sprLeft;
}
with (instance_create_layer(784, 432 - 32 * cherryCount, layer, objCherry)) {
	visible = false;
	image_speed = 0;
	sprite_index = sprRight;
}
if (++cherryCount != 6) {
	alarm[2] = 5;
} else {
	with (objCherry) {
		if (x == 16) {
			hspeed = 5;
		} else if (x == 784) {
			hspeed = -5;
		}
	}
}