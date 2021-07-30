vertex_format_delete(format);

for (var i = 0; i != 3; ++i) {
	for (var j = 0; j != 3; ++j) {
		for (var k = 0; k != 3; ++k) {
			vertex_delete_buffer(cubes[i][j][k]);
		}
	}
}