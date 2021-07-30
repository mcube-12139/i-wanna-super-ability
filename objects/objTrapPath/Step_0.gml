/// @description Check if triggered

if (triggered) {
	if (timeLeft >= 0) {
		--timeLeft;
		if (timeLeft == 0) {
			if (next || instance_exists(objPlayer)) {
				++nowIndex;
				if (nowIndex < trgCount) {
					vspeed = v[nowIndex];
					hspeed = h[nowIndex];
				
					timeLeft = time[nowIndex];
				}
			}
		}
	}
} else if (global.trigger[trg]) {
    triggered = true;
	
    vspeed = v[0];
    hspeed = h[0];
	
	timeLeft = time[0];
}