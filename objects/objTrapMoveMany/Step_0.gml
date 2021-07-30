/// @description Check if triggered

if (triggered) {
	if (timeLeft >= 0) {
		--timeLeft;
		if (timeLeft == 0) {
			if (nowStop || instance_exists(objPlayer)) {
				speed = 0;
				triggered = false;
			}
		}
	}
} else {
	if (nowIndex < trgCount && global.trigger[trg[nowIndex]]) {
	    triggered = true;
	
	    vspeed = v[nowIndex];
	    hspeed = h[nowIndex];
	
		timeLeft = time[nowIndex];
		nowStop = stop[nowIndex];
		++nowIndex;
	}
}