var r = irandom_range(1, 6);
var i;
var ii = 8;
var iii = 4;
var yy = y;

for (i = 0; i != 3; ++i) {
	with (instance_create_layer(x, yy, layer, objCherry)) {
		image_speed = 0;
		sprite_index = r mod ii div iii != 0 ? sprGreenCherry : sprRedCherry;
		hspeed = -4;
	}
	yy += 32;
	ii = ii >> 1;
	iii = iii >> 1;
}
alarm[0] = 50;