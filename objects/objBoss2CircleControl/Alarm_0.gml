for (var i = 0; i != 60; ++i) {
	var ins = cherries[i];
	if (ins != noone) {
		with (ins) {
			++changeCount;
			event_user(0);
		}
	}
}
alarm[0] = 15;