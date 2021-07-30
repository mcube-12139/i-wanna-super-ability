// needle end

needles[0].z += 2;
for (var i = 1; i != 22; ++i) {
	needles[i].y -= 2;
}
needles[22].z += 2;
if (--needleTime != 0) {
	alarm[11] = 1;
} else {
	myalarm[1] = 1;
	alarm[10] = 1;
	myalarm[0] = 1;
}