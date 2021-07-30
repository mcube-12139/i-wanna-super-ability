// 3D draw
gpu_set_cullmode(cull_clockwise);
gpu_set_ztestenable(true);
gpu_set_zfunc(cmpfunc_less);
camera_set_view_mat(view_camera[0], global.viewMat);
camera_set_proj_mat(view_camera[0], global.persProjMat);
draw_set_color(c_white);
if (global.draw3D) {
	with (objBlockBoss2) {
		event_user(0);
	}
	with (objSpikeUpBoss2) {
		event_user(0);
	}
}
with (objBoss2) {
	event_user(0);
}
matrix_set(matrix_world, matrix_build_identity());
gpu_set_cullmode(cull_noculling);
gpu_set_ztestenable(false);

// 2D draw
if (!global.draw3D) {
	with (objBlockBoss2) {
		draw_self();
	}
	with (objSpikeUpBoss2) {
		draw_self();
	}
}
with (objBossSave) {
	draw_self();
}
with (objBoss2Jewel) {
	draw_self();
}
with (objBoss2GreenGoomba) {
	event_perform(ev_draw, 0);
}
with (objCherry) {
	draw_self();
}
with (objCherryNoDestroy) {
	draw_self();
}
with (objGreenCherry) {
	draw_self();
}
with (objBoss2_2cherryNotKiller) {
	draw_self();
}
with (objPlayer) {
	event_perform(ev_draw, 0);
}
with (objBoss2GreenCherryBounce) {
	draw_self();
}
with (objWorldWarpVis) {
	draw_self();
}
with (objBullet) {
	draw_self();
}
with (objBlood) {
	draw_self();
}
with (objWater3) {
	draw_self();
}
draw_set_color(c_black);