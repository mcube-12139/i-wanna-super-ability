with (objFuckBlock) {
	if (object_index != objBlockInvis && object_index != objMovingPlatform) {
		if (other.sprite_index != sprGreenBullet || !is_green(self)) {
			with (other) {
				if (place_meeting(x, y, other)) {
					instance_destroy();
					exit;
				}
			}
		}
	}
}
with (objBlockFake) {
	if (other.sprite_index != sprGreenBullet || !is_green(self)) {
		with (other) {
			if (place_meeting(x, y, other)) {
				instance_destroy();
				exit;
			}
		}
	}
}