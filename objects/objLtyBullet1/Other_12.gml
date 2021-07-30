cherries[count] = instance_create_layer(400, 304 - dist, layer, objLtyCherry);
dists[count] = dist;
dirs[count] = 90;
++count;
cherries[count] = instance_create_layer(400, 304 + dist, layer, objLtyCherry);
dists[count] = dist;
dirs[count] = 270;
++count;
dist += 32;