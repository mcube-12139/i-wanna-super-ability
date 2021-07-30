if (timeLeft >= 0) {
	--timeLeft;
	if (timeLeft == 0) {
		direction += direction > 180 ? -180 : 180;
		timeLeft = time;
	}
}