/// @description scrStopMusic()
/// Stops any music currently playing
function scrStopMusic() {

	global.currentMusicID = -1;

	audio_stop_sound(global.currentMusic);


}
