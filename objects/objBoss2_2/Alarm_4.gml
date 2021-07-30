// poison water

inst_waterLeft.x += 8;
inst_waterRight.x -= 8;
if (--waterMoveTime != 0) {
	alarm[4] = 1;
}