key = 1;
trg = 2;
snd = sndSpikeTrap;
onTrigger = function () {
	with (inst_fakeAfter2) {
		instance_create_layer(x, y, layer, objFakePlatform).hspeed = hspeed;
		instance_destroy();
	}
};