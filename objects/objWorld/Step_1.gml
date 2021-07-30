if (!global.gamePaused) {
	if (global.worldWarpTime > 0) {
		if (global.worldWarpTime > 100) {
			global.worldWarpAlpha += 0.01;
		} else {
			global.worldWarpAlpha -= 0.01;
		}
	
		if (global.worldWarpTime == 100) {
			room_goto(global.worldWarpRoom);
		}
		--global.worldWarpTime;
	}
}