var zz;

zz = 0;
for (var i = 0; i != 2; ++i) {
	if (i != 0 || image_alpha == 1) {
		matrix_set(matrix_world, matrix_build(x, y, zz, 0, 0, 0, 1, 1, 1));
		vertex_submit(global.blockVertex, pr_trianglelist, global.blockTex[indices[i]]);
	}
	zz += 32;
}