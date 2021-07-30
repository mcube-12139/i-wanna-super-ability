if (changeCount == 5) {
	changeCount = 0;
	switch (sprite_index) {
	case sprRedCherry:
		sprite_index = sprGreenCherry;
		break;
	case sprGreenCherry:
		sprite_index = sprRedCherry;
		break;
	}
}