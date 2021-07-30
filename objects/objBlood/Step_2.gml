var meet = false;

with (objBlockInvis) {
	if (place_meeting(x, y, other)) {
		if (visible) {
			event_user(0);
			exit;
		}
		meet = true;
	}
}
if (!meet && (collide_brick(x, y) || place_meeting(x, y, objBlockFake))) {
	event_user(0);
}