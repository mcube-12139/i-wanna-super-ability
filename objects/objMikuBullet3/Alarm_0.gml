var vsp = -3.556;

with (cherries[count2++]) {
	repeat (5) {
		with (instance_create_layer(x, y, layer, objMikuCherry)) {
			hspeed = -12;
			vspeed = vsp;
		}
		with (instance_create_layer(x, y, layer, objMikuCherry)) {
			hspeed = 12;
			vspeed = vsp;
		}
		vsp += 1.4224;
	}
	instance_destroy();
}
if (count2 == 3) {
	instance_destroy();
}