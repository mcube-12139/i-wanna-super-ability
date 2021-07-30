event_inherited();

for (var i = 0; i != 12; ++i) {
	if (myalarm[i] >= 0) {
		--myalarm[i];
		if (myalarm[i] == 0) {
			myalarmPerform[i]();
		}
	}
}