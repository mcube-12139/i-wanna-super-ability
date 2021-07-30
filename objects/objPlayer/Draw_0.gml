/// @description Draw the player

var drawX = x;
var drawY = y;
var yy;

if (global.grav == -1) { // Need to draw the player a pixel off in the y-axis when flipped
    drawY += 1;
}

draw_sprite_ext(sprite_index,image_index,drawX,drawY,image_xscale*xScale,image_yscale*global.grav,image_angle,image_blend,image_alpha);

// Draw the player's hitbox
if (global.debugShowHitbox) {
    draw_sprite_ext(mask_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha*0.8);
}

if (meetPoison) {
	yy = floor(y);
	draw_set_color(c_lime);
	draw_rectangle(x - 63, yy - 28, x - 63 + 127 * global.oxygen / 250, yy - 23, false);
	draw_set_color(c_black);
	draw_rectangle(x - 63, yy - 28, x + 64, yy - 23, true);
}