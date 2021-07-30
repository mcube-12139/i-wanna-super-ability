/// @description Check if player left the room and update player sprite (if set to)

with (objPlayerKiller) {
	if ((global.ability != 1 || !is_green(self)) && place_meeting(x, y, other)) {
		scrKillPlayer(true);
		exit;
	}
}

with (objSpikeUpBoss2) {
	if (z == 16 && place_meeting(x, y, other)) {
		scrKillPlayer(true);
		exit;
	}
}

if (collide_brick(x, y)) {
	scrKillPlayer(false);
	exit;
}

if ((x < 0 || x > room_width || y < 0 || y > room_height) && global.edgeDeath) {
    scrKillPlayer(true);
    exit;
}

// Collide with poison water
meetPoison = place_meeting(x, y, objWater3);
if (!meetPoison) {
	global.oxygen = 250;
} else {
	if (global.ability != 1) {
		--global.oxygen;
	} else {
		global.oxygen -= 50;
	}
	if (global.oxygen <= 0) {
		scrKillPlayer(true);
        exit;
	}
}

// Check collision with triggers
with (objFreeTrigger) {
    with (other) {
        if (place_meeting(x, y, other)) {
            with (other) {
                event_user(1);
            }
        }
    }
}

with (all) {
	if (is_green(self)) {
		var meetXOffset;
		
		if (object_index == objWalljumpR) {
			meetXOffset = -1;
		} else if (object_index == objWalljumpL) {
			meetXOffset = 1;
		} else {
			meetXOffset = 0;
		}
		if (global.ability == 1 && place_meeting(x + meetXOffset, y, other)) {
			// fade out
            image_alpha -= 0.1;
			if (image_alpha < 0.3) {
				image_alpha = 0.3;
			}
		} else {
            // fade in
			image_alpha += 0.1;
			if (image_alpha > 1) {
				image_alpha = 1;
			}
		}
	}
}

// Update player sprite
if (PLAYER_ANIMATION_FIX) {
	// Block/vine checks
	var notOnBlock = (!collide_brick(x,y+(global.grav)));
	
	var onVineR = place_meeting(x+1,y,objWalljumpR) && global.ability != 1 && notOnBlock;
	var onVineL = place_meeting(x-1,y,objWalljumpL) && global.ability != 1 && notOnBlock;
	
	if (!onVineR && !onVineL) { // Not touching any vines
		if (onPlatform || !notOnBlock) { // Standing on something
			// Check if moving left/right
			var L = (scrButtonCheck(global.leftButton) || (DIRECTIONAL_TAP_FIX && scrButtonCheckPressed(global.leftButton)));
			var R = (scrButtonCheck(global.rightButton) || (DIRECTIONAL_TAP_FIX && scrButtonCheckPressed(global.rightButton)));
			
			if ((L || R) && !frozen) {
				sprite_index = global.playerRunSpr[global.ability];
			} else {
				sprite_index = global.playerIdleSpr[global.ability];
			}
		} else { // In the air
			if ((vspeed * global.grav) < 0) {
				sprite_index = global.playerJumpSpr[global.ability];
			} else {
				sprite_index = global.playerFallSpr[global.ability];
			}
		}
	} else { // Touching a vine
		sprite_index = sprPlayerSlide;
	}
}