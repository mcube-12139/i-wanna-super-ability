onCollide = function () {
	objPlayer.frozen = true;
	instance_create_layer(0, 0, layer, objBoss1Plot);
};