var ins = instance_create_layer(0, 504 - 200 * count, layer, objMikuCherry);
cherries[count] = ins;
with (ins) {
	image_xscale = 5;
	image_yscale = 5;
	hspeed = 20;
}
if (count != 2) {
	alarm[1] = 24;
}
alarm[4] = 21;