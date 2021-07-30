--time;
fora rotatings arof {
	var cube = rotatings[i];
	var cubex = cube[0];
	var cubey = cube[1];
	var cubez = cube[2];
	
	var cubeRot = cubeRots[cubex][cubey][cubez];
	var cubeRotAxis = cubeRot[rotAxis];
	if (time != 0) {
		cubeRotAxis += rotSpd;
	} else {
		cubeRotAxis = 0;
	}
	cubeRot[@ rotAxis] = cubeRotAxis;
}

if (time != 0) {
	alarm[0] = 1;
} else {
	// swap colors
	fora rotColors arof {
		var rotColor = rotColors[i];
		// save first
		var rotColorFirst = rotColor[0];
		var rotColorFirstFace = rotColorFirst[0];
		var rotColorFirstLen = array_length(rotColorFirst);
		var temp = [];
		var j = 0;
		for (var k = 1; k != rotColorFirstLen; ++k) {
			temp[j] = colors[rotColorFirstFace][rotColorFirst[k]];
			++j;
		}
		
		// 012 = 123
		for (var k = 0; k != 3; ++k) {
			var rotColorCurr = rotColor[k];
			var rotColorNext = rotColor[k + 1];
			var rotColorCurrFace = rotColorCurr[0];
			var rotColorNextFace = rotColorNext[0];
			
			for (var l = 1; l != rotColorFirstLen; ++l) {
				var colorIndexCurr = rotColorCurr[l];
				var colorIndexNext = rotColorNext[l];
				colors[rotColorCurrFace][colorIndexCurr] = colors[rotColorNextFace][colorIndexNext];
			}
		}
		
		// load first
		var rotColorLast = rotColor[3];
		var rotColorLastFace = rotColorLast[0];
		j = 0;
		for (var k = 1; k != rotColorFirstLen; ++k) {
			colors[rotColorLastFace][rotColorLast[k]] = temp[j];
			++j;
		}
	}
	// update
	fora rotatings arof {
		var cube = rotatings[i];
		var cubex = cube[0];
		var cubey = cube[1];
		var cubez = cube[2];
	
		cube_update(cubex, cubey, cubez);
	}
}