if (vspeed > 8) {
	vspeed = 8;
}

if (!enableStamp) {
	myimageAngle += rotateSpeed;;
}

if (place_meeting(x + hspeed, y, objBlockBoss2)) {
	hspeed = -hspeed;
}
if (place_meeting(x, y + vspeed + gravity, objBlockBoss2)) {
	move_contact_solid(270, vspeed + gravity);
	vspeed = -gravity;
	if (!enableStamp) {
		enableStamp = true;
		myimageAngle = 0;
		hspeed = 3 * sign(hspeed);
	}
}
if (place_meeting(x + hspeed, y + vspeed + gravity, objBlockBoss2)) {
	hspeed = -hspeed;
}