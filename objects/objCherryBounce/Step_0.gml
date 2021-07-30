/// @description Bounce against solids

move_bounce_solid(false);
if (place_meeting(x + hspeed, y, objBlockFake)) {
	hspeed = -hspeed;
}
if (place_meeting(x, y + vspeed, objBlockFake)) {
	vspeed = -vspeed;
}
if (place_meeting(x + hspeed, y + vspeed, objBlockFake)) {
	hspeed = -hspeed;
	vspeed = -vspeed;
}