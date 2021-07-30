fora cherries arof {
	with (cherries[i]) {
		var insNext = instance_create_layer(x, y, layer, objNext);
		insNext.image_speed = 0;
		instance_destroy();
	}
	cherries[i] = insNext;
}
event_perform(ev_alarm, 2);