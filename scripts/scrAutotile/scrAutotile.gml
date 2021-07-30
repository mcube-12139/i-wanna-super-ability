function autotile_add_pos(xx, yy) {
	var pos = string(xx) + "," + string(yy);
	if (!ds_map_exists(global.blockPosMap, pos)) {
		global.blockPosMap[? pos] = id;
	}
}

function autotile_get_index(xx, yy, w, h) {
	var u, ur, r, dr, d, dl, l, ul;
	
	u  = autotile_brick_exists(xx,     yy - h, w, h) << 7;
	ur = autotile_brick_exists(xx + w, yy - h, w, h) << 6;
	r  = autotile_brick_exists(xx + w, yy,     w, h) << 5;
	dr = autotile_brick_exists(xx + w, yy + h, w, h) << 4;
	d  = autotile_brick_exists(xx,     yy + h, w, h) << 3;
	dl = autotile_brick_exists(xx - w, yy + h, w, h) << 2;
	l  = autotile_brick_exists(xx - w, yy,     w, h) << 1;
	ul = autotile_brick_exists(xx - w, yy - h, w, h);
					
	return global.autotileIndex[u + ur + r + dr + d + dl + l + ul];
}

function autotile_brick_exists(xx, yy, w, h) {
	var pos = string(xx) + "," + string(yy);
	if (ds_map_exists(global.blockPosMap, pos)) {
		return global.blockPosMap[? pos].scale == scale;
	}
	if (xx <= -w || xx >= room_width || yy <= -h || yy >= room_height) {
		return true;
	}
	return false;
}

function autotile_update(mode) {
	var xscl;
	var yscl;
	var i;
	var j;
	
	if (mode == 0) {
		ds_map_clear(global.blockPosMap);
    
		with (all) {
			if ((object_index == objBlock || object_index == objGreenBrick) && x >= 0 && x < room_width && y >= 0 && y < room_height) {
				xscl = image_xscale / scale;
				yscl = image_yscale / scale;
				
				for (i = 0; i < xscl; ++i) {
					for (j = 0; j < yscl; ++j) {
						autotile_add_pos(x + i * singleWidth, y + j * singleHeight);
					}
				}
			} else if (object_index == objBlockFake || object_index == objFakeGreenBlock) {
				autotile_add_pos(x, y);
			}
		}
	}
}

function autotile_exec(mode) {
	var xscl;
	var yscl;
	var i;
	var j;
	
	if (mode == 0) {
		with (all) {
			if (object_index == objBlock || object_index == objGreenBrick) {
				xscl = image_xscale / scale;
				yscl = image_yscale / scale;
			
				for (i = 0; i < xscl; ++i) {
					for (j = 0; j < yscl; ++j) {
						indices[i][j] = autotile_get_index(x + i * singleWidth, y + j * singleHeight, singleWidth, singleHeight);
					}
				}
			} else if (object_index == objBlockFake || object_index == objFakeGreenBlock) {
				image_index = autotile_get_index(x, y, sprite_width, sprite_height) + 0.5; // fuck GMS2 for image_index bug
			} else if (object_index == objBlockInvis) {
				image_index = 46.5;
			}
		}
	} else if (mode == 1) {
		with (all) {
			if ((object_index == objBlock || object_index == objGreenBrick) && x >= 0 && x < room_width && y >= 0 && y < room_height) {
				xscl = image_xscale / scale;
				yscl = image_yscale / scale;
				
				for (i = 0; i < xscl; ++i) {
					for (j = 0; j < yscl; ++j) {
						indices[i][j] = 0;
					}
				}
			}
		}
	}
}