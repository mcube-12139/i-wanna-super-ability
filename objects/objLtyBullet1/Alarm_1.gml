event_user(2);
if (count != 50) {
	alarm[1] = 4;
} else {
	do {
		event_user(2);
	} until (count == 64);
}