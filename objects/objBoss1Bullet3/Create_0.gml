var i;
var dir = 0;

satellites = [];
hspeeds = [];
vspeeds = [];
myHSpeed = random_range(-1, 1);
myVSpeed = random_range(4, 6);
time = 40;

for (i = 0; i != 12; ++i) {
	satellites[i] = instance_create_layer(x, y, layer, objBoss1Bullet1);
	hspeeds[i] = 2 * dcos(dir);
	vspeeds[i] = 2 * dsin(dir);
	dir += 30;
}