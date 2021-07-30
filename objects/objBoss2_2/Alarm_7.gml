// poison water end

inst_waterLeft.x -= 8;
inst_waterRight.x += 8;
if (--waterMoveTime != 0) {
	alarm[7] = 1;
} else {
	++attackType;
	if (attackType == 1) {
		instance_create_layer(400, 144, layer, objBoss2_2windmill);
		alarm[8] = 400;
	} else if (attackType == 2) {
		alarm[9] = 50;
	} else if (attackType == 3) {
		alarm[10] = 50;
	}
}