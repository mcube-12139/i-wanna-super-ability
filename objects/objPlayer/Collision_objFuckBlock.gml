/// @description Check block collisions

// Check for horizontal collisions
if (global.ability == 1 && is_green(other)) {
	exit;
}

if (collide_brick(x+hspeed,y)) {
	if (hspeed <= 0) {
		move_contact_solid(180,abs(hspeed));
    } else {
		move_contact_solid(0,abs(hspeed));
	}
		
    hspeed = 0;
}

// Check for vertical collisions
if (collide_brick(x,y+vspeed)) {
	if(vspeed <= 0) {
		move_contact_solid(90,abs(vspeed));
		
		if (global.grav == -1) {
			djump = 1;
		}
    } else {
		move_contact_solid(270,abs(vspeed));
		
		if (global.grav == 1) {
			djump = 1;
		}
	}
	
    vspeed = 0;
}

// Check for diagonal collisions
if (collide_brick(x+hspeed,y+vspeed)) {
	hspeed = 0;
}