// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrGetMusic(){
	var mus = -1;
	
	switch (room) {
	case rTitle:
	case rMenu:
	case rOptions:
	case rWorld1_1:
	case rWorld1_2:
	case rWorld1_3:
	case rWorld1_4:
	case rWorld1_5:
	case rWorld1_6:
	case rWorld1_7:
		mus = musWorld1;
		break;
	case rWorld2_1:
	case rWorld2_2:
	case rWorld2_3:
	case rWorld2_4:
	case rWorld2_5:
	case rWorld2_6:
	case rWorld2_7:
	case rWorld2_8:
		mus = musWorld2;
		break;
	case rEnd:
		mus = musEnding;
		break;
	}
	
	if (mus != -1) {
		scrPlayMusic(mus, true);
	} else {
		scrStopMusic();
	}
}