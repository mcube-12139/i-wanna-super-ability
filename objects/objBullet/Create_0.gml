/// @description Start moving the bullet

// Get the bullet's direction based off the direction the player is facing

var bulletDir = (instance_exists(objPlayer)) ? objPlayer.xScale : 1;

if (global.ability == 1) {
	sprite_index = sprGreenBullet;
}
// Set the bullet's speed
hspeed = bulletDir * 16;

// Destroy the bullet in 40 frames
alarm[0] = 40;