/// @description Check if triggered

if (triggered) {
	if (timeLeft >= 0) {
		--timeLeft;
		if (timeLeft == 0) {
			if (stop || instance_exists(objPlayer)) {
				speed = 0;
			}
		}
	}
} else if (global.trigger[trg]) {
    triggered = true;
	
	if (v != 0 || h != 0) {
        vspeed = v;
        hspeed = h;
    } else if (spd != 0) {
        speed = spd;
        direction = dir;
    }
	
	timeLeft = time;
}