var m = count % 4;
var xx;
var yy;
var dir;

if (m == 0) {
	xx = 0;
	yy = random(304);
	dir = random_range(300, 323);
} else if (m == 1) {
	xx = random(400);
	yy = 0;
	dir = random_range(300, 323);
} else if (m == 3) {
	xx = random_range(400, 800);
	yy = 0;
	dir = random_range(217, 240);
} else {
	xx = 800;
	yy = random(304);
	dir = random_range(217, 240);
}
	
with (instance_create_layer(xx, yy, layer, objLtyCherry)) {
	motion_set(dir, 5);
	enableDestroy = true;
}
++count;
alarm[0] = 5;