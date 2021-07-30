/// @description Collide player

if (key == -1 || global.trigger[key]) {
    global.trigger[trg] = true;
    if (snd != -1) {
    	audio_play_sound(snd, 0, false);
    }
    onTrigger();
    instance_destroy();
}