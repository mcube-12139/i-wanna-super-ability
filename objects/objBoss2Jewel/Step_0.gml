if (vspeed > 7) {
	vspeed = 7;
}

if (place_meeting(x + hspeed, y, objBlockBoss2)) {
	hspeed = -hspeed;
}
if (place_meeting(x, y + vspeed + 0.25, objBlockBoss2)) {
	vspeed = -7.25;
}
if (place_meeting(x + hspeed, y + vspeed + 0.25, objBlockBoss2)) {
	hspeed = -hspeed;
	vspeed = -7.25;
}