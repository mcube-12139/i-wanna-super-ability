var cosVal;
var sinVal;
var xx;
var yy;

rotation += rotationSpeed;
if (rotation >= 360) {
	rotation -= 360;
}
cosVal = 16 * dcos(rotation);
sinVal = 16 * dsin(rotation);
xx = x - 5 * cosVal;
yy = y + 5 * sinVal;
fora satellites arof {
	with (satellites[i]) {
		x = xx;
		y = yy;
	}
	xx += cosVal;
	yy -= sinVal;
}