/*
alarm 1 - cherry wall start
alarm 2 - cherry wall
alarm 3 - block change
alarm 4 - poison water
alarm 5 - cherry fall
alarm 6 - needle move
alarm 7 - poison water end
alarm 8 - windmill end
alarm 9 - Π
alarm 10 - poison updraft start
alarm 11 - poison updraft

user 2 - poison water start
*/

event_inherited();

yrotSpeed = 4.8;

// 0 = cherry wall
// 1 = windmill
// 2 = Π
attackType = 0;

noHitTime = 0;
targetHP = 0;

cherryWallCount = 0;
cherryCount = 0;

greenIndex = 0;
greenIndexLeft = 0;
greenIndexRight = 0;

blockChangeCount = 0;

piCount = 0;

finalStart = false;

waterMoveTime = 0;
needleMoveTime = 0;

alarm[1] = 50;
alarm[3] = 50;