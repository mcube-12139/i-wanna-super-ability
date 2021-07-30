/// @description Collect this item

global.bossItem[itemNum] = true;

audio_play_sound(sndItem,0,false);
onCollide();
instance_destroy();