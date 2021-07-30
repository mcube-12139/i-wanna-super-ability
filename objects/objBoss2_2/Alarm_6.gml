// needle move

with (objSpikeUpBoss2) {
	y -= 8;
}
if (--needleMoveTime != 0) {
	alarm[6] = 1;
}