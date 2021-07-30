centerY += -12 + 0.6 * time;
event_user(10);
++time;
if (time != 41) {
	alarm[1] = 1;
} else {
	alarm[0] = 1;
	time = 0;
}