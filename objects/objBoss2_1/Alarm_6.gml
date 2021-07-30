global.worldWarpColor = c_black;
global.worldWarpAlpha = 0;

if (hp == 0) {
	global.draw3D = false;
}
for (var i = 0; i != 6; ++i) {
	for (var j = 0; j != 9; ++j) {
		ds_stack_push(colorStack, colors[i][j]);
	}
}
dizzyCount = 0;
event_perform(ev_alarm, 7);