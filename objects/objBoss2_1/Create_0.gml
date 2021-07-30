/*
alarm 0 - rotate
alarm 1 - darken screen
alarm 2 - throw 6 cherries and goombas
alarm 3 - start go down
alarm 4 - go down
alarm 5 - throw 6 cherries and 1 big goomba
alarm 6 - start dizzy
alarm 7 - dizzy
alarm 8 - stop dizzy
alarm 9 - needle start
alarm 10 - needle wave start
alarm 11 - needle

my alarm 0 - needle wave
my alarm 1 - throw 9 jewels 1
my alarm 2 - needle wall
my alarm 3 - throw 9 jewels 2
my alarm 4 - needle bounce
my alarm 5 - phase 2

user 0 - draw 3D
user 1 - draw health bar
*/

event_inherited();

noHitTime = 0;

throwCount = 0;
// 0 = throw 6
// 1 = throw 1 big
// 2 = needle wave + jewel
// 3 = needle wall + jewel
attackType = 0;
// target health
targetHP = 0;
// dizzy count
dizzyCount = 0;
// needle count
needleCount = 0;
needleAngles = array_create(23, 0);
needleTime = 0;
needles = [];

needleBounce = false;
needleBounceTime = 0;

// 0 = random 1 = circle
goDownAttackType = 0;

myalarm = array_create(12, -1);
// needle wave
myalarmPerform[0] = function () {
	for (var i = 0; i != needleCount; ++i) {
		var val = 24 * dcos(needleAngles[i]) + 24;
		needles[i].z = val < 16 ? 16 : val;
		needleAngles[i] += 2.4;
	}
	myalarm[0] = 1;
};
// throw 9 jewels 1
myalarmPerform[1] = function () {
	cube_rotate(irandom(2), irandom(2), choose(-9, 9), 10);
	audio_play_sound(sndThrow, 0, false);
	with (instance_create_layer(x, y, layer, objBoss2Jewel)) {
		motion_set(random(360), 3);
		onGetAll = function () {
			with (objBoss2_1) {
				alarm[3] = 50;
				for (var i = 1; i != 22; ++i) {
					instance_destroy(needles[i]);
				}
				inst_needleLeft.z = 16;
				inst_needleRight.z = 16;
				myalarm[0] = -1;
			}	
		};
	}
	if (++throwCount != 9) {
		myalarm[1] = 25;
	}
};
// needle wall
myalarmPerform[2] = function () {
	var r = irandom(4);
	var yy = 560;
	for (var i = 0; i != 6; ++i) {
		var zz = (i != r && i != r + 1) ? 16 : 48;
		with (instance_create_layer(0, yy, layer, objSpikeUpBoss2)) {
			z = zz;
			hspeed = 2;
			zrotation = 270;
			mask_index = sprSpikeRightMaskBoss2;
		}
		yy -= 32;
	}
	myalarm[2] = 80;
};
// throw 9 jewels 2
myalarmPerform[3] = function () {
	cube_rotate(irandom(2), irandom(2), choose(-9, 9), 10);
	audio_play_sound(sndThrow, 0, false);
	with (instance_create_layer(x, y, layer, objBoss2Jewel)) {
		motion_set(random(360), 3);
		onGetAll = function () {
			with (objSpikeUpBoss2) {
				if (hspeed != 0) {
					instance_destroy();
				}
			}
			with (objBoss2_1) {
				myalarm[2] = -1;
				alarm[3] = 50;
			}
		};
	}
	if (++throwCount != 9) {
		myalarm[3] = 25;
	}
};
// needle bounce
myalarmPerform[4] = function () {
	if (--needleBounceTime == 0) {
		needleBounceTime = 352;
		inst_needleLeft.hspeed *= -1;
		inst_needleRight.hspeed *= -1;
	}
	myalarm[4] = 1;
};
// phase 2 start
myalarmPerform[5] = function () {
	global.worldWarpColor = c_white;
	global.worldWarpAlpha = 1;
	yrotSpeed = 3.6;
	myalarm[6] = 5;
};
// phase 2
myalarmPerform[6] = function () {
	global.worldWarpColor = c_black;
	global.worldWarpAlpha = 0;
	audio_play_sound(sndTeleport, 0, false);
	if (instance_exists(objPlayer)) {
		instance_destroy(objPlayer);
		global.autosave = true;
		room_goto(rWorld2_boss2);
	}
};

global.draw3D = true;
global.worldWarpAlpha = 1;
alarm[1] = 1;
alarm[2] = 100;