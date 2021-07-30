var kidX;
var kidY;

if (instance_exists(objPlayer)) {
	kidX = objPlayer.x;
	kidY = objPlayer.y;
	with (objMikuCherry) {
		motion_set(point_direction(x, y, kidX, kidY) + 180, 18);
	}
}
instance_destroy();