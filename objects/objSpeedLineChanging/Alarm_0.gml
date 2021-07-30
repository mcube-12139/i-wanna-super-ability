switch (sprite_index) {
case sprHighSpeedLineH:
	sprite_index = sprSlowLineH;
	targetSpeed = 1;
	break;
case sprSlowLineH:
	sprite_index = sprNormalLineH;
	targetSpeed = 3;
	break;
default:
	sprite_index = sprHighSpeedLineH;
	targetSpeed = 6;
}
alarm[0] = 50;