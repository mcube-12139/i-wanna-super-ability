var i;
var ins;

if (time-- == 0) {
	time = 40;
	for (i = 0; i != 12; ++i) {
		hspeeds[i] = -hspeeds[i];
		vspeeds[i] = -vspeeds[i];
	}
}

x += myHSpeed;
y += myVSpeed;
fora satellites arof {
	ins = satellites[i];
	ins.x += hspeeds[i] + myHSpeed;
	ins.y += vspeeds[i] + myVSpeed;
}