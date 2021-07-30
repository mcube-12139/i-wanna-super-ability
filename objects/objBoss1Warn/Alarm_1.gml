audio_play_sound(sndSpikeTrap, 0, false);
with (objMoveKiller) {
    vspeed = -1;
    time = 32;
    timeLeft = time;
}
instance_destroy();