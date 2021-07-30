/// @description Handle player movement

// Check left/right button presses
var L = (scrButtonCheck(global.leftButton) || (DIRECTIONAL_TAP_FIX && scrButtonCheckPressed(global.leftButton)));
var R = (scrButtonCheck(global.rightButton) || (DIRECTIONAL_TAP_FIX && scrButtonCheckPressed(global.rightButton)));

var h = 0; //Keeps track if the player is moving left/right

if (!frozen) { // Don't move if frozen
    if (R) {
        h = 1;
    } else if (L) {
        h = -1;
	}
}

// Collide with speed line
var nextHSpeed = baseMaxHSpeed;
var meetSpeedLine = false;

var ins = instance_place(x, y, objHighSpeedLineH);
if (ins != noone) {
	if (global.ability != 1 || !is_green(ins)) {
		nextHSpeed = ins.targetSpeed;
		meetSpeedLine = true;
	}
}

if (baseMaxHSpeed != nextHSpeed) {
	baseMaxHSpeed = nextHSpeed;
	audio_play_sound(sndBlockChange, 0, false);
}

// Collide with speed area
maxHSpeed = baseMaxHSpeed;
if (global.ability != 1 && place_meeting(x, y, objHighSpeedArea)) {
	maxHSpeed = 6;
}
if (place_meeting(x, y, objLowSpeedArea)) {
	maxHSpeed = 1;
}

// Check if on a slip block
var slipBlockTouching = instance_place(x,y+(global.grav),objSlipBlock);

// Vine checks
var notOnBlock = (!collide_brick(x,y+(global.grav)));
	
var onVineR = place_meeting(x+1,y,objWalljumpR) && global.ability != 1 && notOnBlock;
var onVineL = place_meeting(x-1,y,objWalljumpL) && global.ability != 1 && notOnBlock;

if (h != 0) { // Player is moving
	if (!onVineR && !onVineL) { // Make sure we're not currently on a vine
		xScale = h; // Set the direction the player is facing
	}
	
	if ((h == -1 && !onVineR) || (h == 1 && !onVineL)) { // Make sure we're not moving off a vine (that's handled later)
	    if (slipBlockTouching == noone) { // Not touching a slip block, move immediately at full speed
	        hspeed = maxHSpeed * h;
	    } else { // Touching a slip block, use acceleration
			hspeed += (slipBlockTouching.slip) * h;
		
			if (abs(hspeed) > maxHSpeed) {
				hspeed = maxHSpeed * h;
			}
	    }
	}
	
    sprite_index = global.playerRunSpr[global.ability];
} else { // Player is not moving
    if (slipBlockTouching == noone) { // Not touching a slip block, stop immediately
        hspeed = 0;
    } else { // Touching a slip block, slow down
        if (hspeed > 0) {
            hspeed -= slipBlockTouching.slip;
            
            if (hspeed <= 0) {
                hspeed = 0;
			}
        } else if (hspeed < 0) {
            hspeed += slipBlockTouching.slip;
            
            if (hspeed >= 0) {
                hspeed = 0;
			}
        }
    }
  
    sprite_index = global.playerIdleSpr[global.ability];
}

// Check if standing on a platform
if (!onPlatform) {
    if ((vspeed * global.grav) < -0.05) {
		sprite_index = global.playerJumpSpr[global.ability];
    } else if ((vspeed * global.grav) > 0.05) {
		sprite_index = global.playerFallSpr[global.ability];
	}
} else {
    if (!place_meeting(x,y+(4*global.grav),objPlatform)) {
		onPlatform = false;
	}
}

// Check if on a slide block
var slideBlockTouching = instance_place(x,y+(global.grav),objSlideBlock);

if (slideBlockTouching != noone) { // On a slide block, start moving with it
    hspeed += slideBlockTouching.slide;
}

// Collide with water
var ins = instance_place(x, y, objWaterParent);
if (ins != noone) {
	if ((vspeed*global.grav) > 2) {
		vspeed = 2 * global.grav;
	}
	
	if (ins.refreshDjump) {
		djump = 1;
	}
}

// Check if moving faster vertically than max speed
if (abs(vspeed) > maxVSpeed) {
	vspeed = sign(vspeed) * maxVSpeed;
}

// Check buttons for player actions
if (!frozen) { // Check if frozen before doing anything
    if (scrButtonCheckPressed(global.jumpButton)) {
        scrPlayerJump();
	}
    if (scrButtonCheckReleased(global.jumpButton)) {
        scrPlayerVJump();
	}
    if (scrButtonCheckPressed(global.shootButton)) {
        scrPlayerShoot();
	}
	if (keyboard_check_pressed(88)) { // X - switch ability
		if (global.bossItem[0]) {
			global.ability = 1 - global.ability;
			with (objGreenBrick) {
				solid = (global.ability != 1);
			}
			with (objBlockBoss2) {
				solid = (indices[0] != 5 || global.ability != 1);
			}
			audio_play_sound(global.ability == 1 ? sndAbility1 : sndAbility2, 0, false);
		}
	}
    if (scrButtonCheckPressed(global.suicideButton)) {
        scrKillPlayer(true);
	}
}
with (objBullet) {
    event_user(0);
}

// A/D align
if (global.adAlign && collide_brick(x,y+global.grav) && !frozen) {
    if (scrButtonCheckPressed(global.alignLeftButton)) {
		hspeed -= 1;
	}
    if (scrButtonCheckPressed(global.alignRightButton)) {
		hspeed += 1;
	}
}

// Handle walljumps
if (onVineL || onVineR) {
    if (onVineR) {
        xScale = -1;
    } else {
        xScale = 1;
	}
    
    vspeed = 2 * global.grav;
    sprite_index = sprPlayerSlide;
    
    // Check if moving away from the vine
	if (onVineL && scrButtonCheckPressed(global.rightButton)) || (onVineR && scrButtonCheckPressed(global.leftButton)) {
        if (scrButtonCheck(global.jumpButton)) { // Jumping off vine
            if (onVineR) {
                hspeed = -15;
            } else {
                hspeed = 15;
			}
            
            vspeed = -9 * global.grav;
            audio_play_sound(sndWallJump,0,false);
            sprite_index = global.playerJumpSpr[global.ability];
        } else { // Moving off vine
			if (onVineR) {
                hspeed = -3;
            } else {
                hspeed = 3;
			}
            
            sprite_index = global.playerFallSpr[global.ability];
        }
    }
}

// I hate these code
var stamp = false;
if (global.ability != 1) {
	with (objBoss2GreenGoomba) {
		if (enableStamp) {
			with (other) {
				if (place_meeting(x + hspeed, y + vspeed + gravity, other)) {
					if (vspeed > 0) {
						stamp = true;
						with (other) {
							if (image_xscale != 1) {
								for (var i = -2; i != 6 ; i += 4) {
									with (instance_create_layer(x, y, layer, objBoss2GreenGoomba)) {
										image_xscale = other.image_xscale / 2;
										image_yscale = other.image_yscale / 2;
										hspeed = i;
										vspeed = -8;
										onStamp = other.onStamp;
									}
								}
							}
							onStamp();  
							instance_destroy();
						}
						audio_play_sound(sndStamp, 0, false);
					} else {
						scrKillPlayer(true);
					}
				}
			}
		}
	}
	if (stamp) {
		vspeed = -5 - gravity;
		djump = true;
	}
}

// Handle slopes
if (instance_exists(objSlope) && hspeed != 0) { // Make sure slopes exist in the current room and the player is moving horitontally before doing checks
    var moveLimit = abs(hspeed); // Sets how far the player can go up/down to snap onto a slope, this can be increased to make the player able to run over steeper slopes (ie setting it to abs(hspeed)*2 allows the player to run over slopes twice as steep)
    
    var slopeCheck; // Keeps track of whether we're still checking the current slope loop
    var hTest; // Keeps track of how far horizontally we're currently checking
    var vTest; // Keeps track of how far vertically we're currently checking
    
    // Check for falling onto a slope
    if (place_meeting(x+hspeed,y+vspeed+gravity,objSlope) && (vspeed+gravity)*global.grav > 0 && notOnBlock) {
        // Store previous coordinates in case snapping onto the slope fails
		var xLast = x;
        var yLast = y;
        var hLast = hspeed;
        var vLast = vspeed;
		
		vspeed += gravity; // Apply gravity to current vspeed to check where the player will be
        
        x += hspeed; // Move the player to the next position horizontally
        hspeed = 0;
        
		// Snap the player to any solids in the way
        if (collide_brick(x,y+vspeed)) {
            if (global.grav == 1) {
                move_contact_solid(270,abs(vspeed));
            } else {
                move_contact_solid(90,abs(vspeed));
			}
            vspeed = 0;
        }
        
        y += vspeed; // Move the player to the next position vertically
        
        if (collide_brick(x,y+(global.grav)) && !collide_brick(x,y)) { // Check if we snapped onto the slope properly
            djump = 1;
            notOnBlock = false;
        } else { // Did not snap onto the slope, return to previous position
            x = xLast;
            y = yLast;
            hspeed = hLast;
            vspeed = vLast;
        }
    }
    
    // Check for moving down a slope
    if (!notOnBlock) {
        var onSlope = (place_meeting(x,y+(global.grav),objSlope)); // Check if we're standing on slope, treat normal blocks the same as slopes if we are
        
        slopeCheck = true;
        hTest = hspeed;
        
        while (slopeCheck) {
            vTest = 0;
            // Check how far we should move down for this check
            while ((!place_meeting(x+hTest,y-vTest+global.grav, objSlope) || (onSlope && !collide_brick(x+hTest,y-vTest+global.grav))) && (vTest*global.grav > -floor(moveLimit*(hTest/hspeed)))) {
                vTest -= global.grav;
            }
            
            // Check if we there's a slope close enough to fall down onto
            if (place_meeting(x+hTest,y-vTest+(global.grav), objSlope) || (onSlope && collide_brick(x+hTest,y-vTest+global.grav))) {
                if (vTest != 0 && !collide_brick(x+hTest,y-vTest)) { // Check if we are moving and not stuck in any blocks
                    y -= vTest;
                    
                    x += hTest;
                    hspeed = 0;
                    
                    slopeCheck = false;
                } else { // Did not snap onto the slope, lower horizontal movement and check again
                    if (hTest > 0) {
                        hTest -= 1;
                        if (hTest <= 0) {
                            slopeCheck = false;
						}
                    } else if (hTest < 0) {
                        hTest += 1;
                        if (hTest >= 0) {
                            slopeCheck = false;
						}
                    } else {
                        slopeCheck = false;
                    }
                }
            } else { //Not close enough to any slopes, cancel check
                slopeCheck = false;
            }
        }
    }
    
    // Check for moving up a slope
    if (place_meeting(x+hspeed,y,objSlope)) {
        slopeCheck = true;
        hTest = hspeed;
        
        while (slopeCheck) {
            vTest = 0;
            
            // Check how far we have to move up for this check
            while (place_meeting(x+hTest,y-vTest,objSlope) && vTest*global.grav < floor(moveLimit*(hTest/hspeed))) {
                vTest += global.grav;
            }
            
            // Check if we can move without hitting any solids
            if (!collide_brick(x+hTest,y-vTest)) {
                y -= vTest;
                
                x += hTest;
                hspeed = 0;
                
                slopeCheck = false;
            } else { // Something is in the way, lower horizontal movement and check again
                if (hTest > 0) {
                    hTest -= 1;
                    if (hTest <= 0) {
                        slopeCheck = false;
					}
                } else if (hTest < 0) {
                    hTest += 1;
                    if (hTest >= 0) {
                        slopeCheck = false;
					}
                } else {
                    slopeCheck = false;
                }
            }
        }
    }
    
    // Set the xprevious/yprevious coordinates to the current x/y for future solid collisions
    xprevious = x;
    yprevious = y;
}