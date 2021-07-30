// needle start

var ins;

needles[0] = inst_needleLeft;
for (var i = 1; i != 22; ++i) {
	ins = instance_create_layer(48 + 32 * i, 592, layer, objSpikeUpBoss2);
	ins.z = 48;
	needles[i] = ins;
}
needles[22] = inst_needleRight;
needleTime = 16;
alarm[11] = 1;