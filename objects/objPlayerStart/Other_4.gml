/// @description Spawn the player

if (!instance_exists(objPlayer)) {
	with (instance_create_layer(x+17,y+23,"Player",objPlayer)) {
		visible = other.vis;
	}
}
instance_destroy();