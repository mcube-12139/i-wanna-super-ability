centerX += -9 + 0.45 * time;
event_user(10);
++time;
if (time != 41) {
	alarm[3] = 1;
} else {
	alarm[0] = 1;
	time = 0;
}