var k = 0;

// =
for (var i = 0; i != 2; ++i) {
	if (redLineOrCol == 1 && i == 0) {
		continue;
	}
	
	var xx;
	var yy;
	var step;
	var spr;
	if (i == 0) {
		xx = x - 16;
		yy = y - 16;
		step = -32;
	} else {
		xx = x - 144;
		yy = y - 144;
		step = 32;
	}
	if (redLineOrCol == 0 && i == redIndex) {
		spr = sprRedCherry;
	} else {
		spr = sprGreenCherry;
	}
	for (var j = 0; j != 4; ++j) {
		var xxx = xx + step * j;
		var ins = instance_create_layer(xxx, yy, layer, objCherryNoDestroy);
		cherries[k] = ins;
		rhos[k] = point_direction(x, y, xxx, yy);
		dists[k] = point_distance(x, y, xxx, yy);
		++k;
		with (ins) {
			image_speed = 0;
			sprite_index = spr;
		}
	}
}

// ||
for (var i = 0; i != 2; ++i) {
	var xx;
	var yy;
	var step;
	var spr;
	if (i == 0) {
		xx = x - 16;
		yy = y - 144;
		step = 32;
	} else {
		xx = x - 144;
		yy = y - 16;
		step = -32;
	}
	if (redLineOrCol == 1 && i == redIndex) {
		spr = sprRedCherry;
	} else {
		spr = sprGreenCherry;
	}
	for (var j = 0; j != 4; ++j) {
		var yyy = yy + step * j;
		var ins = instance_create_layer(xx, yyy, layer, objCherryNoDestroy);
		cherries[k] = ins;
		rhos[k] = point_direction(x, y, xx, yyy);
		dists[k] = point_distance(x, y, xx, yyy);
		++k;
		with (ins) {
			image_speed = 0;
			sprite_index = spr;
		}
	}
}