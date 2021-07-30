var cosVal;
var sinVal;
var xx;
var yy;
var i = 0;

rotation = random(180);
rotationSpeed = random_range(1.2, 2.4);
satellites = [];

hspeed = -4;
cosVal = 16 * dcos(rotation);
sinVal = 16 * dsin(rotation);
xx = x - 5 * cosVal;
yy = y + 5 * sinVal;
repeat (10) {
	satellites[i++] = instance_create_layer(xx, yy, layer, objBoss1Bullet1);
	xx += cosVal;
	yy -= sinVal;
}