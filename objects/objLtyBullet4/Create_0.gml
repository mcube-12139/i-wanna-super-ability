cherries = [];
centerX = 0;
centerY = 0;
time = 0;
var i = 0;
var dir = 0;
repeat (32) {
	with (objPlayer) {
		other.centerX = x;
		other.centerY = y;
		other.cherries[i++] = instance_create_layer(x + 128 * dcos(dir), y - 128 * dsin(dir), layer, objLtyCherry);
	}
	dir += 11.25;
}
rotation = 0;
alarm[0] = 1;
event_user(0);