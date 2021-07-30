++piCount;

var rloc;
var ri;
var r = choose(0, 1, 2);
if (r == 0) {
	rloc = 1;
	ri = 0;
} else if (r == 1) {
	rloc = 1;
	ri = 1;
} else {
	rloc = 0;
	ri = choose(0, 1);
}
with (instance_create_layer(0, 448, layer, objBoss2_2pi)) {
	redLineOrCol = rloc;
	redIndex = ri;
	event_user(0);
}
if (piCount != 9) {
	alarm[9] = 80;
} else {
	event_user(2);
}