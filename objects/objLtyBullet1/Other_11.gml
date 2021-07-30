cherries[count] = instance_create_layer(400 - dist, 304, layer, objLtyCherry);
dists[count] = dist;
dirs[count] = 180;
++count;
cherries[count] = instance_create_layer(400 + dist, 304, layer, objLtyCherry);
dists[count] = dist;
dirs[count] = 0;
++count;
dist += 32;