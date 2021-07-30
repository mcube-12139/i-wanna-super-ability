/// @description scrInitGlobals()
/// Initializes all global variables needed for the game

#macro forl for (var i = 0, sz = ds_list_size(
#macro lrof ); i != sz; ++i)
#macro fora for (var i = 0, sz = array_length(
#macro arof ); i != sz; ++i)
#macro CUBE_BLUE $ff0000
#macro CUBE_ORANGE $007fff
#macro CUBE_GREEN $00ff00
#macro CUBE_RED $0000ff
#macro CUBE_YELLOW $00ffff
#macro CUBE_WHITE $ffffff

#macro CUBE_DARK_BLUE $7f0000
#macro CUBE_DARK_ORANGE $003f7f
#macro CUBE_DARK_GREEN $007f00
#macro CUBE_DARK_RED $00007f
#macro CUBE_DARK_YELLOW $007f7f
#macro CUBE_DARK_WHITE $7f7f7f

function scrInitGlobals() {

	scrInitEngineOptions(); // Initialize engine options

	// Initialize basic game variables
	
	/*
	0 = no
	1 = invalidate green
    So you can know that there are more than 1 abilities in my plan.
	*/
	global.ability = 0;
	
	global.playerIdleSpr = [sprPlayerIdle, sprGreenPlayerIdle];
	global.playerFallSpr = [sprPlayerFall, sprGreenPlayerFall];
	global.playerJumpSpr = [sprPlayerJump, sprGreenPlayerJump];
	global.playerRunSpr = [sprPlayerRun, sprGreenPlayerRun];
	
	global.oxygen = 250;
	
	global.autotileRoomPrev = -1;
	global.blockPosMap = ds_map_create();
#region autotile index
	global.autotileIndex = [
		46,
		46,
		45,
		45,
		46,
		46,
		45,
		45,
		42,
		42,
		37,
		37,
		42,
		42,
		36,
		36,
		46,
		46,
		45,
		45,
		46,
		46,
		45,
		45,
		42,
		42,
		37,
		37,
		42,
		42,
		36,
		36,
		43,
		43,
		33,
		33,
		43,
		43,
		33,
		33,
		35,
		35,
		23,
		23,
		35,
		35,
		21,
		21,
		43,
		43,
		33,
		33,
		43,
		43,
		33,
		33,
		34,
		34,
		22,
		22,
		34,
		34,
		20,
		20,
		46,
		46,
		45,
		45,
		46,
		46,
		45,
		45,
		42,
		42,
		37,
		37,
		42,
		42,
		36,
		36,
		46,
		46,
		45,
		45,
		46,
		46,
		45,
		45,
		42,
		42,
		37,
		37,
		42,
		42,
		36,
		36,
		43,
		43,
		33,
		33,
		43,
		43,
		33,
		33,
		35,
		35,
		23,
		23,
		35,
		35,
		21,
		21,
		43,
		43,
		33,
		33,
		43,
		43,
		33,
		33,
		34,
		34,
		22,
		22,
		34,
		34,
		20,
		20,
		44,
		44,
		39,
		38,
		44,
		44,
		39,
		38,
		32,
		32,
		27,
		25,
		32,
		32,
		26,
		24,
		44,
		44,
		39,
		38,
		44,
		44,
		39,
		38,
		32,
		32,
		27,
		25,
		32,
		32,
		26,
		24,
		41,
		41,
		31,
		30,
		41,
		41,
		31,
		30,
		19,
		19,
		15,
		14,
		19,
		19,
		7,
		6,
		41,
		41,
		31,
		30,
		41,
		41,
		31,
		30,
		17,
		17,
		11,
		10,
		17,
		17,
		3,
		2,
		44,
		44,
		39,
		38,
		44,
		44,
		39,
		38,
		32,
		32,
		27,
		25,
		32,
		32,
		26,
		24,
		44,
		44,
		39,
		38,
		44,
		44,
		39,
		38,
		32,
		32,
		27,
		25,
		32,
		32,
		26,
		24,
		40,
		40,
		29,
		28,
		40,
		40,
		29,
		28,
		18,
		18,
		13,
		12,
		18,
		18,
		5,
		4,
		40,
		40,
		29,
		28,
		40,
		40,
		29,
		28,
		16,
		16,
		9,
		8,
		16,
		16,
		1,
		0,
	];
#endregion

	global.worldWarpTime = 0;
	global.worldWarpRoom = -1;
	global.worldWarpColor = c_black;
	global.worldWarpAlpha = 0;
	
	global.viewMat = [];
	global.persProjMat = [];
	global.orthoViewMat = [];
	global.orthoProjMat = [];
	global.blockVertex = 0;
	global.blockFormat = 0;
	global.blockTex = [];
	global.spikeTex = -1;
	global.spikeVertex = 0;
	global.draw3D = false;

	global.saveNum = 1;
	global.difficulty = 0; // 0 = medium, 1 = hard, 2 = very hard, 3 = impossible
	global.deaths = 0;
	global.time = 0;
	global.timeMicro = 0;
	global.saveRoom = "";
	global.savePlayerX = 0;
	global.savePlayerY = 0;
	global.grav = 1;
	global.saveGrav = 1;

	global.secretItem = array_create(SECRET_ITEM_TOTAL,false);
	global.saveSecretItem = array_create(SECRET_ITEM_TOTAL,false);

	global.bossItem = array_create(BOSS_ITEM_TOTAL,false);
	global.saveBossItem = array_create(BOSS_ITEM_TOTAL,false);

	global.gameClear = false;
	global.saveGameClear = false;

	global.trigger = array_create(50,false);

	global.gameStarted = false; // Determines whether the game is currently in progress (enables saving, restarting, etc.)
	global.noPause = false; // Sets whether or not to allow pausing (useful for bosses to prevent desync)
	global.autosave = false; // Keeps track of whether or not to autosave the game the next time the player is created
	global.noDeath = false; // Keeps track of whether to give the player god mode
	global.infJump = false; // Keeps track of whether to give the player infinite jump

	global.gamePaused = false; // Keeps track of whether the game is paused or not
	global.pauseSpr = -1; // Copies the application surface when the game is paused
	global.pauseDelay = 0; // Sets a pause delay so that the player can't quickly pause/unpause to prevent pause buffer strats

	global.currentMusicID = -1; // Keeps track of what song the current main music is
	global.currentMusic = -1; // Keeps track of the current main music instance
	global.deathSound = -1; // Keeps track of the death sound when the player dies
	global.gameOverMusic = -1; // Keeps track of the game over music instance
	global.musicFading = false; // Keeps track of whether the main music is currently fading out
	global.currentGain = 0; // Keeps track of the current main music gain before a song is faded out

	global.menuSelectPrev[0] = 0; // Keeps track of the previously selected option when navigating away from the difficulty menu
	global.menuSelectPrev[1] = 0; // Keeps track of the previously selected option when navigating away from the options menu

	display_set_gui_size(surface_get_width(application_surface),surface_get_height(application_surface)); // Set the correct GUI size for the Draw GUI event

	global.controllerMode = false; // Keeps track of whether to use keyboard or controller for inputs
	global.controllerDelay = -1; // Handles delay for switching between keyboard/controller so that the player can't use both at the same time

	randomize(); // Make sure the game starts with a random seed for RNG


}
