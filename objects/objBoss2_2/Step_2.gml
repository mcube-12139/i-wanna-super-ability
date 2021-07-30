// no hit time
if (noHitTime != 0) {
	--noHitTime;
	if (noHitTime == 0) {
		for (var i = 5; i != -1; --i) {
			for (var j = 8; j != -1; --j) {
				colors[i][j] = ds_stack_pop(colorStack);
			}
		}
		cube_update_all();
	}
}

// collide bullet
var yy = 52.30964537049814 + 0.8279287981233613 * y;
var bul = collision_rectangle(x - 64, yy - 80, x + 64, yy + 80, objBullet, false, false);
if (bul != noone) {
	instance_destroy(bul);
	if (noHitTime == 0) {
		noHitTime = 75;
		--hp;
		if (hp != 0) {
			audio_play_sound(sndBossHit, 0, false);
		} else {
			instance_destroy(objSpikeUpBoss2);
			instance_destroy(objCherry);
			scrStopMusic();
			audio_play_sound(sndDeath, 0, false);
			with (instance_create_layer(384, 352, layer, objWorldWarpVis)) {
				roomTo = rEnd;
			}
			instance_destroy();
			exit;
		}
		fora colors arof {
			for (var j = 0; j != 9; ++j) {
				ds_stack_push(colorStack, colors[i][j]);
				switch (colors[i][j]) {
				case CUBE_WHITE:
					colors[i][j] = CUBE_DARK_WHITE;
					break;
				case CUBE_YELLOW:
					colors[i][j] = CUBE_DARK_YELLOW;
					break;
				case CUBE_GREEN:
					colors[i][j] = CUBE_DARK_GREEN;
					break;
				case CUBE_BLUE:
					colors[i][j] = CUBE_DARK_BLUE;
					break;
				case CUBE_RED:
					colors[i][j] = CUBE_DARK_RED;
					break;
				case CUBE_ORANGE:
					colors[i][j] = CUBE_DARK_ORANGE;
					break;
				}
			}
		}
		cube_update_all();
		if (hp == targetHP + 3 || finalStart) {
			finalStart = false;
			for (var i = 240; i != 592; i += 32) {
				instance_create_layer(i, 464, layer, objSpikeUpBoss2);
			}
			needleMoveTime = 4;
			event_perform(ev_alarm, 6);
		} else if (hp == targetHP) {
			alarm[5] = -1;
			alarm[7] = 50;
			waterMoveTime = 16;
			with (objSpikeUpBoss2) {
				instance_destroy();
			}
		}
	}
}