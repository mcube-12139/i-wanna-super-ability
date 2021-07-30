event_user(1);
if (count != 24) {
	alarm[0] = 4;
} else {
	do {
		event_user(1);
	} until (count == 32);
	dist = 32;
}