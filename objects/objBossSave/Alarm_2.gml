x -= 3.2;
y += 1.6;
image_xscale += 0.2;
image_yscale -= 0.1;
if (image_yscale > 0) {
	alarm[2] = 1;
} else {
	instance_destroy();
}