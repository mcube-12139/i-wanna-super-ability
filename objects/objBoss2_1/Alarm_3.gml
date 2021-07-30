// start go down

if (instance_exists(objPlayer)) {
	if (goDownAttackType == 0) {
		with (objBlockBoss2) {
			if ((x >= 32 && x < 224) || (x >= 576 && x < 768)) {
				indices[0] = 5;
				solid = (global.ability != 1);
			} else {
				indices[0] = irandom_range(1, 4);
			}
			indices[1] = irandom_range(1, 5);
		}
		targetHP = hp - 3;
	} else {
		with (objBlockBoss2) {
			indices[0] = irandom_range(1, 4);
			indices[1] = irandom_range(1, 5);
		}
		targetHP = 0;
	}
	goDownTime = 0;
	alarm[4] = 1;
}