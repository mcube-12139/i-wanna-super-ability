global.draw3D = false;
global.viewMat = matrix_build_lookat(400, 304, -600, 400, 304, 0, 0, 1, 0);
// fov = 2 * datan(304 / 600)
// aspect = 800 / 608
global.persProjMat = matrix_build_projection_perspective_fov(53.739626174998136, 1.3157894736842106, 599, 32000);
global.orthoViewMat = camera_get_view_mat(view_camera[0]);
global.orthoProjMat = camera_get_proj_mat(view_camera[0]);

// block vertex format
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_color();
vertex_format_add_texcoord();
global.blockFormat = vertex_format_end();

// block textures
for (var i = 0; i != 6; ++i) {
	global.blockTex[i] = sprite_get_texture(sprBlockBoss2, i);
}
// spike texture
global.spikeTex = sprite_get_texture(sprSpikeUpBoss2, 0);

// block vertex data
// forgive me for using so many statements
global.blockVertex = vertex_create_buffer();
vertex_begin(global.blockVertex, global.blockFormat);
vertex_position_3d(global.blockVertex, 32, 0, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 0);
vertex_position_3d(global.blockVertex, 32, 32, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 1);
vertex_position_3d(global.blockVertex, 32, 0, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 0);
vertex_position_3d(global.blockVertex, 32, 32, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 1);
vertex_position_3d(global.blockVertex, 32, 0, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 0);
vertex_position_3d(global.blockVertex, 32, 32, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 1);
vertex_position_3d(global.blockVertex, 0, 32, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 0);
vertex_position_3d(global.blockVertex, 0, 32, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 1);
vertex_position_3d(global.blockVertex, 32, 32, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 0);
vertex_position_3d(global.blockVertex, 32, 32, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 1);
vertex_position_3d(global.blockVertex, 32, 32, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 0);
vertex_position_3d(global.blockVertex, 0, 32, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 1);
vertex_position_3d(global.blockVertex, 32, 0, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 0);
vertex_position_3d(global.blockVertex, 32, 32, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 1);
vertex_position_3d(global.blockVertex, 0, 0, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 0);
vertex_position_3d(global.blockVertex, 0, 32, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 1);
vertex_position_3d(global.blockVertex, 0, 0, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 0);
vertex_position_3d(global.blockVertex, 32, 32, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 1);
vertex_position_3d(global.blockVertex, 0, 0, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 0);
vertex_position_3d(global.blockVertex, 0, 32, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 1);
vertex_position_3d(global.blockVertex, 0, 0, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 0);
vertex_position_3d(global.blockVertex, 0, 32, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 1);
vertex_position_3d(global.blockVertex, 0, 0, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 0);
vertex_position_3d(global.blockVertex, 0, 32, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 1);
vertex_position_3d(global.blockVertex, 0, 0, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 0);
vertex_position_3d(global.blockVertex, 0, 0, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 0);
vertex_position_3d(global.blockVertex, 32, 0, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 1);
vertex_position_3d(global.blockVertex, 32, 0, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 1);
vertex_position_3d(global.blockVertex, 32, 0, 32);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 1);
vertex_position_3d(global.blockVertex, 0, 0, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 0);
vertex_position_3d(global.blockVertex, 0, 0, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 0);
vertex_position_3d(global.blockVertex, 0, 32, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 1);
vertex_position_3d(global.blockVertex, 32, 0, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 0);
vertex_position_3d(global.blockVertex, 32, 32, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 1);
vertex_position_3d(global.blockVertex, 32, 0, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 1, 0);
vertex_position_3d(global.blockVertex, 0, 32, 0);
vertex_color(global.blockVertex, c_white, 1);
vertex_texcoord(global.blockVertex, 0, 1);
vertex_end(global.blockVertex);

// spike vertex data
global.spikeVertex = vertex_create_buffer();
vertex_begin(global.spikeVertex, global.blockFormat);
vertex_position_3d(global.spikeVertex, 0, -16, -16);
vertex_color(global.spikeVertex, c_white, 1);
vertex_texcoord(global.spikeVertex, 0.5, 0);
vertex_position_3d(global.spikeVertex, -16, 16, -16);
vertex_color(global.spikeVertex, c_white, 1);
vertex_texcoord(global.spikeVertex, 0, 1);
vertex_position_3d(global.spikeVertex, 16, 16, -16);
vertex_color(global.spikeVertex, c_white, 1);
vertex_texcoord(global.spikeVertex, 1, 1);
vertex_position_3d(global.spikeVertex, 0, -16, -16);
vertex_color(global.spikeVertex, c_white, 1);
vertex_texcoord(global.spikeVertex, 0.5, 0);
vertex_position_3d(global.spikeVertex, 16, 16, -16);
vertex_color(global.spikeVertex, c_white, 1);
vertex_texcoord(global.spikeVertex, 0, 1);
vertex_position_3d(global.spikeVertex, 16, 16, 16);
vertex_color(global.spikeVertex, c_white, 1);
vertex_texcoord(global.spikeVertex, 1, 1);
vertex_position_3d(global.spikeVertex, 0, -16, -16);
vertex_color(global.spikeVertex, c_white, 1);
vertex_texcoord(global.spikeVertex, 0.5, 0);
vertex_position_3d(global.spikeVertex, 16, 16, 16);
vertex_color(global.spikeVertex, c_white, 1);
vertex_texcoord(global.spikeVertex, 0, 1);
vertex_position_3d(global.spikeVertex, -16, 16, 16);
vertex_color(global.spikeVertex, c_white, 1);
vertex_texcoord(global.spikeVertex, 1, 1);
vertex_position_3d(global.spikeVertex, 0, -16, -16);
vertex_color(global.spikeVertex, c_white, 1);
vertex_texcoord(global.spikeVertex, 0.5, 0);
vertex_position_3d(global.spikeVertex, -16, 16, 16);
vertex_color(global.spikeVertex, c_white, 1);
vertex_texcoord(global.spikeVertex, 0, 1);
vertex_position_3d(global.spikeVertex, -16, 16, -16);
vertex_color(global.spikeVertex, c_white, 1);
vertex_texcoord(global.spikeVertex, 1, 1);
vertex_end(global.spikeVertex);