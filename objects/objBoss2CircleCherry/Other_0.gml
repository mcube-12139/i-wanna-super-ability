with (creator) {
	cherries[other.index] = noone;
	--cherryCount;
	if (cherryCount == 0) {
		instance_destroy();
	}
}

event_inherited();