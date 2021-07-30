cherries[count] = instance_create_layer(xx, 448 - 64 * dsin(18 * count), layer, objLtyCherry);
xx += 32;
if (++count != 25) {
	alarm[0] = 4;
}