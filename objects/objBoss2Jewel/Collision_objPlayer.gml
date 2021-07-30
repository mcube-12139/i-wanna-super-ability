audio_play_sound(sndJewel, 0, false);
if (instance_number(object_index) == 1 && onGetAll != pointer_null) {
	onGetAll();
}
instance_destroy();