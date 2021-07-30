/*
alarm 0 - rotate

user 0 - draw 3D
*/

// set colors
colors = [[], [], [], [], [], []];
var cols = [CUBE_BLUE, CUBE_ORANGE, CUBE_GREEN, CUBE_RED, CUBE_YELLOW, CUBE_WHITE];
for (var i = 5; i != -1; --i) {
	for (var j = 8; j != -1; --j) {
		colors[i][j] = cols[i];
	}
}

// cube vertex: VertexBuffer[3][3][3]
cubes = [[[], [], []], [[], [], []], [[], [], []]];
// cube rotation: number[3][3][3][3]
cubeRots = [[[[], [], []], [[], [], []], [[], [], []]], [[[], [], []], [[], [], []], [[], [], []]], [[[], [], []], [[], [], []], [[], [], []]]];
// rotating cubes: number[][3]
rotatings = [];
// 0 = x 1 = y 2 = z
rotAxis = 0;
// rotate speed
rotSpd = 0;
// restructure this plz
rotColors = [];

yrotation = 315;
yrotSpeed = 1.2;
// rotate time left
time = 0;

// color stack
colorStack = ds_stack_create();

// cube vertex format: (pos: vec3, color: Color)
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_color();
format = vertex_format_end();

for (var i = 0; i != 3; ++i) {
	for (var j = 0; j != 3; ++j) {
		for (var k = 0; k != 3; ++k) {
			cubes[i][j][k] = vertex_create_buffer();
			for (var l = 0; l != 3; ++l) {
				cubeRots[i][j][k][l] = 0;
			}
			cube_update(i, j, k);
		}
	}
}

// health
hpMax = 21;
hp = hpMax;