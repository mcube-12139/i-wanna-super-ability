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
		--hp;
		if (hp != 0) {
			audio_play_sound(sndBossHit, 0, false);
		} else {
			instance_destroy(objSpikeUpBoss2);
			instance_destroy(objCherry);
			instance_destroy(objBoss2CircleControl);
			scrStopMusic();
			audio_play_sound(sndDeath, 0, false);
		}
		if (hp != targetHP) {
			noHitTime = 75;
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
			if (hp <= 5 && !needleBounce) {
				needleBounce = true;
				audio_play_sound(sndBlockChange, 0, false);
				inst_needleLeft.hspeed = 2;
				inst_needleRight.hspeed = -2;
				needleBounceTime = 352;
				myalarm[4] = 1;
			}
		} else {
			alarm[4] = -1;
			y = 128;
			yrotSpeed = 0;
			yrotation = choose(45, 135, 225, 315);
			global.worldWarpColor = c_white;
			global.worldWarpAlpha = 1;
			alarm[6] = 5;
		}
	}
}