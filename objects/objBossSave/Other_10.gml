/// @description Save the game

if (canSave && instance_exists(objPlayer)) {
    if (!((objPlayer.x < 0 || objPlayer.x > room_width || objPlayer.y < 0 || objPlayer.y > room_height) && global.edgeDeath)) {
        canSave = false; // Set it so that the player can't save again
        image_index = 1; //Set the sprite to green
		alarm[2] = 1; // Set alarm to reset image_index
        scrSaveGame(true); // Save the game
		audio_play_sound(sndSave, 0, false);
		onSave();
    }
}