yrotSpeed = 1.2;
throwCount = 0;
++attackType;
if (attackType == 1) {
	alarm[5] = 50;
} else if (attackType == 2) {
	alarm[9] = 50;
} else if (attackType == 3) {
	myalarm[2] = 50;
	myalarm[3] = 50;
} else if (attackType == 4) {
	goDownAttackType = 1;
	alarm[3] = 50;
}