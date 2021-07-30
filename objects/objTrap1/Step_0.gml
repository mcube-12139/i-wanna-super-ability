var ins;

if (triggered) {
	ins = instance_place(x, y, objHighSpeedLineH);
	if (ins != noone && ins.image_alpha == 1 && speed != ins.targetSpeed) {
		speed = ins.targetSpeed;
		audio_play_sound(sndBlockChange, 0, false);
	}
} else {
	if (global.trigger[trg]) {
		triggered = true;
		speed = spd;
		direction = dir;
		maxDist = point_distance(x, y, tarX, tarY);
	}
}