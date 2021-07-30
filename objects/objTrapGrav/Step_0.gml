/// @description Check if triggered

if (triggered) {
	if (timeLeft >= 0) {
		--timeLeft;
		if (timeLeft == 0) {
			gravity = 0;
			speed = 0;
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
	gravity = grav;
	gravity_direction = gravDir;
	
	timeLeft = time;
}