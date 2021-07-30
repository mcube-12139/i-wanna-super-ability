/// @description Warp the player

if (warpX == 0 && warpY == 0) { // No coordinates set, go to where objPlayerStart is
    with(objPlayer) {
        instance_destroy();
	}
} else { // Coordinates set, move player to them
    with (objPlayer) {
        x = other.warpX;
        y = other.warpY;
        // I don't know why
        // but if I remove this
        // Kid will die when teleported
        // from rWorld2_6 to rWorld2_7
        //*
        var foo = bbox_left;//*/
    }
}

room_goto(roomTo);