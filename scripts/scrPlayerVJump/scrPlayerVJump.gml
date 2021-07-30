/// @description scrPlayerVJump()
/// Makes the player lose upward vertical momentum
function scrPlayerVJump() {

	if (vspeed * global.grav < 0) {
	    vspeed *= 0.45;
	}


}
