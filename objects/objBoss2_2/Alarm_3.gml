// block change

if (++blockChangeCount != 10) {
	with (objBlockBoss2) {
		indices[0] = irandom(4);
		indices[1] = irandom(5);
	}
	alarm[3] = 5;
} else {
	with (objBlockBoss2) {
		indices[0] = 5;
		indices[1] = irandom(5);
		solid = global.ability != 1;
	}
}