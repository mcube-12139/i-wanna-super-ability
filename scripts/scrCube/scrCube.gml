function cube_update(xx, yy, zz) {
	var order = [0, 1, 2, 3, 1, 4, 5, 2, 4, 6, 7, 5, 6, 0, 3, 7, 1, 0, 6, 4, 5, 7, 3, 2];
	var order2 = [0, 1, 3, 1, 2, 3];
	var xgreater = [false, true, true, false, true, true, false, false];
	var ygreater = [false, false, true, true, false, true, false, true];
	var zgreater = [true, true, true, true, false, false, false, false];
	
	var buf = cubes[xx][yy][zz];
	vertex_begin(buf, format);
	var index = 0;
	repeat (6) {
		for (var l = 0; l != 6; ++l) {
			var o2 = order2[l];
			var o = order[index + o2];
					
			var xg = xgreater[o];
			var yg = ygreater[o];
			var zg = zgreater[o];
			var xxx = 48 * xx + (xg ? 48 : 0) - 72;
			var yyy = 48 * yy + (yg ? 48 : 0) - 72;
			var zzz = 48 * zz + (zg ? 48 : 0) - 72;
				
			vertex_position_3d(buf, xxx, yyy, zzz);
			var col;
			if (zz == 2 && index == 0) {
				// back
				col = colors[0][3 * yy + 2 - xx];
			} else if (zz == 0 && index == 8) {
				// front
				col = colors[2][3 * yy + xx];
			} else if (xx == 0 && index == 12) {
				// left
				col = colors[3][3 * yy + 2 - zz];
			} else if (xx == 2 && index == 4) {
				// right
				col = colors[1][3 * yy + zz];
			} else if (yy == 0 && index == 16) {
				// up
				col = colors[4][3 * (2 - zz) + xx];
			} else if (yy == 2 && index == 20) {
				// down
				col = colors[5][3 * zz + xx];
			} else {
				// inner
				col = c_black;
			}
			vertex_color(buf, col, 1);
		}
		index += 4;
	}
	vertex_end(buf);
}

function cube_update_all() {
	for (var i = 0; i != 3; ++i) {
		for (var j = 0; j != 3; ++j) {
			for (var k = 0; k != 3; ++k) {
				cube_update(i, j, k);
			}
		}
	}
}

function cube_rotate(axis, lay, spd, t) {
	rotatings = [];
	rotColors = [];
	var index = 0;
	var index2 = 0;
	if (axis == 0) {
		for (var i = 0; i != 3; ++i) {
			for (var j = 0; j != 3; ++j) {
				rotatings[index++] = [lay, i, j];
			}
		}
		if (spd > 0) {
			rotColors[index2++] = [[0, 8 - lay, 5 - lay, 2 - lay], [4, lay, 3 + lay, 6 + lay], [2, lay, 3 + lay, 6 + lay], [5, lay, 3 + lay, 6 + lay]];
		} else {
			rotColors[index2++] = [[0, 8 - lay, 5 - lay, 2 - lay], [5, lay, 3 + lay, 6 + lay], [2, lay, 3 + lay, 6 + lay], [4, lay, 3 + lay, 6 + lay]];
		}
		if (lay == 0) {
			if (spd > 0) {
				rotColors[index2++] = [[3, 2, 5], [3, 8, 7], [3, 6, 3], [3, 0, 1]];
			} else {
				rotColors[index2++] = [[3, 2, 5], [3, 0, 1], [3, 6, 3], [3, 8, 7]];
			}
		} else if (lay == 2) {
			if (spd > 0) {
				rotColors[index2++] = [[1, 0, 1], [1, 6, 3], [1, 8, 7], [1, 2, 5]];
			} else {
				rotColors[index2++] = [[1, 0, 1], [1, 2, 5], [1, 8, 7], [1, 6, 3]];
			}
		}
	} else if (axis == 1) {
		for (var i = 0; i != 3; ++i) {
			for (var j = 0; j != 3; ++j) {
				rotatings[index++] = [i, lay, j];
			}
		}
		var line = 3 * lay;
		if (spd > 0) {
			rotColors[index2++] = [[0, line, line + 1, line + 2], [1, line, line + 1, line + 2], [2, line, line + 1, line + 2], [3, line, line + 1, line + 2]];
		} else {
			rotColors[index2++] = [[0, line, line + 1, line + 2], [3, line, line + 1, line + 2], [2, line, line + 1, line + 2], [1, line, line + 1, line + 2]];
		}
		if (lay == 0) {
			if (spd > 0) {
				rotColors[index2++] = [[4, 0, 1], [4, 2, 5], [4, 8, 7], [4, 6, 3]];
			} else {
				rotColors[index2++] = [[4, 0, 1], [4, 6, 3], [4, 8, 7], [4, 2, 5]];
			}
		} else if (lay == 2) {
			if (spd > 0) {
				rotColors[index2++] = [[5, 0, 1], [5, 6, 3], [5, 8, 7], [5, 2, 5]];
			} else {
				rotColors[index2++] = [[5, 0, 1], [5, 2, 5], [5, 8, 7], [5, 6, 3]];
			}
		}
	} else {
		for (var i = 0; i != 3; ++i) {
			for (var j = 0; j != 3; ++j) {
				rotatings[index++] = [i, j, lay];
			}
		}
		var line = 3 * (2 - lay);
		var line2 = 3 * lay;
		if (spd > 0) {
			rotColors[index2++] = [[4, line, line + 1, line + 2], [1, lay, lay + 3, lay + 6], [5, line2 + 2, line2 + 1, line2], [3, 8 - lay, 5 - lay, 2 - lay]];
		} else {
			rotColors[index2++] = [[4, line, line + 1, line + 2], [3, 8 - lay, 5 - lay, 2 - lay], [5, line2 + 2, line2 + 1, line2], [1, lay, lay + 3, lay + 6]];
		}
		if (lay == 0) {
			if (spd > 0) {
				rotColors[index2++] = [[2, 0, 1], [2, 2, 5], [2, 8, 7], [2, 6, 3]];
			} else {
				rotColors[index2++] = [[2, 0, 1], [2, 6, 3], [2, 8, 7], [2, 2, 5]];
			}
		} else if (lay == 2) {
			if (spd > 0) {
				rotColors[index2++] = [[0, 0, 1], [0, 6, 3], [0, 8, 7], [0, 2, 5]];
			} else {
				rotColors[index2++] = [[0, 0, 1], [0, 2, 5], [0, 8, 7], [0, 6, 3]];
			}
		}
	}
	
	time = t;
	rotAxis = axis;
	rotSpd = spd;
	alarm[0] = 1;
}