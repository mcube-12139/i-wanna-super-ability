if (instance_exists(objPlayer)) {
	instance_create_layer(x, y, layer, obj).sprite_index = spr;
	instance_destroy();
}