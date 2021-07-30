/// @description Check if triggered

if (triggered) {
	if (timeLeft >= 0) {
		--timeLeft;
		if (timeLeft == 0) {
			event_user(0);
		}
	}
} else if (global.trigger[trg]) {
    triggered = true;
	
	if (time == -1) {
		event_user(0);
	} else {
		timeLeft = time;
	}
}