/*
user 0 - rise water
user 1 - attack

alarm 0 - stop rising water
alarm 1 - stop dropping water
alarm 2 - snipe
alarm 3 - spiral
alarm 4 - reset notHit
alarm 5 - drop water
alarm 6 - windmill
alarm 7 - rain
*/

hp = 15;
count = 0;
spiralDir = 0;
notHit = true;
triggered = false;

image_xscale = 2;
image_yscale = 2;

event_user(1);