/// @description Initialize variables

frozen = false; // Sets if the player can move or not

jump = 8.5 * global.grav; // Sets how fast the player jumps
jump2 = 7 * global.grav; // Sets how fast the player double jumps
gravity = 0.4 * global.grav; // Sets the player's gravity

djump = 1; // Allow the player to double jump as soon as he spawns
maxHSpeed = 3; // Max horizontal speed
maxVSpeed = 9; // Max vertical speed
onPlatform = false; // Sets if the player is currently standing on a platform

baseMaxHSpeed = 3;

xScale = 1; // Sets the direction the player is facing (1 is facing right, -1 is facing left)
meetPoison = false;

if (global.ability == 1) {
	sprite_index = sprGreenPlayerIdle;
}

// Set the player's hitbox depending on gravity direction
if (global.grav == 1) {
	mask_index = sprPlayerMask;
} else {
	mask_index = sprPlayerMaskFlip;
}

// Save the game if currently set to autosave
if (global.autosave) {
    scrSaveGame(true);
    global.autosave = false;
}