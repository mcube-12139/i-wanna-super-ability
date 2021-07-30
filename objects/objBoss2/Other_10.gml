for (var i = 0; i != 3; ++i) {
	for (var j = 0; j != 3; ++j) {
		for (var k = 0; k != 3; ++k) {
			var rots = cubeRots[i][j][k];
			matrix_set(matrix_world, matrix_multiply(matrix_build(0, 0, 0, rots[0], rots[1], rots[2], 1, 1, 1), matrix_build(x, y, 124.70765814495915, -30, yrotation, 0, 1, 1, 1)));
			vertex_submit(cubes[i][j][k], pr_trianglelist, -1);
		}
	}
}