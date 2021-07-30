cherries = [];
cherryCount = 60;

var sprs = [sprRedCherry, sprGreenCherry];
for (var i = 0; i != 60; ++i) {
	var ins = instance_create_layer(x, y, layer, objBoss2CircleCherry);
	cherries[i] = ins;
	with (ins) {
		sprite_index = sprs[(i div 5) % 2];
		index = i;
		creator = other.id;
		motion_set(6 * i, 3);
		changeCount = i % 5;
		event_user(0);
	}
}

alarm[0] = 40;