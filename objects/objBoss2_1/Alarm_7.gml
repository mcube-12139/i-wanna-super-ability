if (++dizzyCount != 15) {
	for (var i = 0; i != 6; ++i) {
		for (var j = 0; j != 9; ++j) {
			colors[i][j] = choose(CUBE_BLUE, CUBE_ORANGE, CUBE_GREEN, CUBE_RED, CUBE_YELLOW, CUBE_WHITE);
		}
	}
	cube_update_all();
	with (objBlockBoss2) {
		indices[0] = irandom_range(1, 4);
		indices[1] = irandom_range(1, 5);
		solid = true;
	}
	alarm[7] = 5;
} else {
	for (var i = 5; i != -1; --i) {
		for (var j = 8; j != -1; --j) {
			colors[i][j] = ds_stack_pop(colorStack);
		}
	}
	cube_update_all();
	if (hp != 0) {
		with (objBlockBoss2) {
			indices[0] = 0;
			indices[1] = 0;
			solid = true;
		}
		alarm[8] = 10;
	} else {
		myalarm[5] = 50;
	}
}