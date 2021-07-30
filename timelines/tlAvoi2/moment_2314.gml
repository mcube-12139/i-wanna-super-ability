// 绘
var dir = 0;

instance_destroy(objLtyBullet6);
repeat (60) {
	with (instance_create_layer(580, 185, "Below_player1", objLtyCherry)) {
		motion_set(dir, 2);
		enableDestroy = true;
	}
	dir += 6;
}