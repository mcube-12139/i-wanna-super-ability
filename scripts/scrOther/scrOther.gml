// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function room_init() {
	var blockSpr = sprBlockMask;
	var spikeDownSpr = sprSpikeDown;
	var spikeLeftSpr = sprSpikeLeft;
	var spikeRightSpr = sprSpikeRight;
	var spikeUpSpr = sprSpikeUp;
	
	var blockTileMode = 0;
	
	switch (room) {
	case rWorld1_1:
	case rWorld1_2:
	case rWorld1_3:
	case rWorld1_4:
	case rWorld1_5:
	case rWorld1_6:
	case rWorld1_7:
	case rWorld1_boss:
	case rWorld1_end:
		blockSpr = sprBlock1;
		spikeDownSpr = sprSpikeDown1;
		spikeLeftSpr = sprSpikeLeft1;
		spikeRightSpr = sprSpikeRight1;
		spikeUpSpr = sprSpikeUp1;
		break;
	case rWorld2_1:
	case rWorld2_2:
	case rWorld2_3:
	case rWorld2_4:
	case rWorld2_5:
	case rWorld2_6:
	case rWorld2_7:
	case rWorld2_8:
	case rWorld2_9:
		blockSpr = sprBlock2;
		spikeDownSpr = sprSpikeDown2;
		spikeLeftSpr = sprSpikeLeft2;
		spikeRightSpr = sprSpikeRight2;
		spikeUpSpr = sprSpikeUp2;
		break;
	case rWorld2_avoi:
		blockSpr = sprBlockAvoi;
		blockTileMode = 1;
		if (global.secretItem[0]) {
			with (instance_create_layer(768, 576, "miku", objLty)) {
				audio_sound_gain(musAvoi2, 0, 0);
				scrPlayMusic(musAvoi2, false);
				audio_sound_gain(musAvoi2, 1, 1000);
				timeline_index = tlAvoi2;
				timeline_running = true;
				alarm[1] = 2364;
			}
		} else {
			instance_create_layer(768, 576, "miku", objMiku);
			with (instance_create_layer(64, 544, "Below_player", objBossSave)) {
				onSave = function () {
					with (objMiku) {
						alarm[0] = 1;
					}
				};
			}
		}
		break;
	case rWorld2_boss2:
		scrPlayMusic(musBoss2_2, true);
	case rWorld2_boss:
		blockTileMode = 1;
		with (objPlayer) {
			visible = false;
		}
		break;
	}
	
	with (all) {
		if (object_index == objSpikeDown) {
			sprite_index = spikeDownSpr;
		} else if (object_index == objSpikeLeft) {
			sprite_index = spikeLeftSpr;
		} else if (object_index == objSpikeRight) {
			sprite_index = spikeRightSpr;
		} else if (object_index == objSpikeUp) {
			sprite_index = spikeUpSpr;
		} else if (object_index == objBlock || object_index == objBlockFake || object_index == objBlockInvis) {
			sprite_index = blockSpr;
		} else if (object_index == objGreenBrick || object_index == objFakeGreenBlock) {
			sprite_index = sprGreenBrick;
		}
	}
	
	if (global.gameStarted && room != global.autotileRoomPrev) {
		global.autotileRoomPrev = room;
        autotile_update(blockTileMode);
	}
    autotile_exec(blockTileMode);
}

function is_green(ins) {
	var spr = ins.sprite_index;
	return (
		spr == sprWalljumpR ||
		spr == sprWalljumpL ||
		spr == sprGreenCherry ||
		spr == sprGreenBrick ||
		spr == sprHighSpeedArea ||
		spr == sprHighSpeedLineH ||
		spr == sprHighSpeedLineV ||
		spr == sprGreenButtonDown ||
		spr == sprGreenButtonLeft ||
		spr == sprGreenButtonRight ||
		spr == sprGreenButtonUp ||
		(spr == sprBlockBoss2 && ins.indices[0] == 5) ||
		spr == sprGreenGoomba ||
		ins.object_index == objMikuCherry
	);
}

function collide_brick(xx, yy) {
    // since place_free() has a bug
    
	if (place_meeting(xx, yy, objBlock)) {
		return true;
	}
	if (global.ability != 1) {
		if (place_meeting(xx, yy, objGreenBrick) || place_meeting(xx, yy, objBlockBoss2)) {
			return true;
		}
	} else {
		with (objBlockBoss2) {
			if (indices[0] != 5) {
				with (other) {
					if (place_meeting(xx, yy, other)) {
						return true;
					}
				}
			}
		}
	}
	return false;
}

