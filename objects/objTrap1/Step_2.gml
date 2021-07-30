if (triggered) {
	nowDist += speed;
	if (nowDist >= maxDist) {
		speed = 0;
		x = tarX;
		y = tarY;
	}
}