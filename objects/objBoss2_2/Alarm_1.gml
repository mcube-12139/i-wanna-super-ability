// cherry wall start

cherryCount = 0;
greenIndex = irandom_range(1, 4);

var arr = [];
var j = 0;
for (var i = 0; i != 6; ++i) {
	if (i != greenIndex) {
		arr[j++] = i;
	}
}
greenIndexLeft = arr[irandom(4)];

j = 0;
for (var i = 0; i != 6; ++i) {
	if (i != greenIndex && i != greenIndexLeft) {
		arr[j++] = i;
	}
}
greenIndexRight = arr[irandom(3)];
event_perform(ev_alarm, 2);
if (++cherryWallCount != 6) {
	alarm[1] = 75;
} else {
	event_user(2);
}