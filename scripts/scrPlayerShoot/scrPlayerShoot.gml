/// @description scrPlayerShoot()
/// Makes the player shoot a bullet
function scrPlayerShoot() {

	if (instance_number(objBullet) < 4) {
	    with (instance_create_layer(x,y-(global.grav*2),layer,objBullet)) {
			if (instance_exists(objBoss2Control)) {
				visible = false;
			}
		}
	    audio_play_sound(sndShoot,0,false);
	}


}
