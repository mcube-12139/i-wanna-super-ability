var i;
var vsp;

for (i = 0; i < 20; ++i) {
	vsp = random_range(3, 6);
	with (instance_create_layer(random_range(x - 112, x + 112), y + time * i * vsp, layer, objCherry)) {
		sprite_index = choose(sprRedCherry, sprGreenCherry);
		image_speed = 0;
		vspeed = vsp;
	}
}
alarm[0] = time;