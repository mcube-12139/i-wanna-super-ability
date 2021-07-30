cherries[count] = instance_create_layer(400 + 192 * dcos(dir), 304 - 192 * dsin(dir), layer, objMikuCherry);
cherryDirs[count++] = dir + 180;
dir += 14.4;
if (count != 25) {
	alarm[0] = 2;
} else {
	alarm[1] = 1;
}