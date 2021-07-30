visible = false;
onSave = function () {
	// Forgive me plz, I can't find the reason
	/*with (objPlayer) {
		if (y >= 567.50) {
			y = 567.40;
		}
	}*/
	instance_create_layer(400, 128, layer, objBoss2_1);
	scrPlayMusic(musBoss2_1, true);
};