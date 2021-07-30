if (time == 0) {
	var k = 0;
	for (var i = 0; i != 4; ++i) {
		var dist;
		var on;
		var total;
	
		if (i % 2 == 0) {
			dist = 72;
			on = objCherryNoDestroy;
			total = 6;
		} else {
			dist = 16;
			on = objGreenCherry;
			total = 24;
		}
	
		for (var l = 0; l != total; ++l) {
			for (var j = 0; j != 2; ++j) {
				var ins = instance_create_layer(x, y, layer, objBoss2_2cherryNotKiller);
				cherries[k] = ins;
				dists[k] = dist * l;
				var rot = 45 * i + (j == 0 ? 0 : 180);
				rotations[k] = rot;
				++k;
				with (ins) {
					motion_set(rot, dist * l / 24);
					objNext = on;
				}
			}
		}
	}
} else if (time == 24) {
	with (objBoss2_2cherryNotKiller) {
		speed = 0;
	}
	alarm[1] = 31;
}
++time;