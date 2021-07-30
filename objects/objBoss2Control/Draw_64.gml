with (objBoss2) {
	event_user(1);
}
with (objGameOver) {
	if (myvisible) {
		event_perform(ev_draw, ev_gui);
	}
}