y = 0.2
yb = 0.75
yballSpot = 4
xMin = -10
xMax = 10
zMin = -14
zMax = 14

rx = rnd*360
ry = rnd*360
rz = rnd*360
t = rnd*3 + 0.5
t2 = t - 0.5
x = xMin + rnd * (xMax - xMin)
z = zMin + rnd * (zMax - zMin)
xSpot1 = x - 5
zSpot1 = z - 5
xSpot2 = x + 5
zSpot2 = z + 5
xSpot3 = x - 5
zSpot3 = z + 5
xSpot4 = x + 5
zSpot4 = z - 5
xcam4 = x + 5
ycam4 = 2
zcam4 = z
sData = "" + x + "," + y + "," + z + "," + t
sDataB = "" + x + "," + yb + "," + z + "," + t
sDataBJump = "" + x + "," + yb + "," + z + "," + 0.1
rData = "" + rx + "," + ry + "," + rz + "," + t
spot1 = "" + xSpot1 + "," + yballSpot + "," + zSpot1 + "," + t
spot2 = "" + xSpot2 + "," + yballSpot + "," + zSpot2 + "," + t
spot3 = "" + xSpot3 + "," + yballSpot + "," + zSpot3 + "," + t
spot4 = "" + xSpot4 + "," + yballSpot + "," + zSpot4 + "," + t
cam4 = "" + xcam4 + "," + ycam4 + "," + zcam4 + "," + t2
runObjectCode "ballSound_trigger"
networkCommand "ball", "moveObject", sData
networkCommand "ball_trigger", "moveObject", sDataB
networkCommand "ball", "rotateObject", rData
networkCommand "ballSpot1", "moveObject", spot1
networkCommand "ballSpot2", "moveObject", spot2
networkCommand "ballSpot3", "moveObject", spot3
networkCommand "ballSpot4", "moveObject", spot4
networkCommand "ball_trigger_jump", "moveObject", sDataBJump
networkCommand "ball_trigger_jump_pos", "moveObject", sDataBJump
networkCommand "cam4", "moveObject", cam4
// wait 0.1
// networkCommand "ball_trigger_jump", "scaleObject", "50, 50, 50, 0.01"
//wait 0.01
// networkCommand "ball_trigger_jump", "scaleObject", "0.1, 0.1, 0.1, 0.01"
wait t
if x > 8.75 then
playSound "12", "oneshot", "2D"
else if x < -8.75 then
playSound "12", "oneshot", "3D"
else if z > 12.75 then
playSound "17", "oneshot", "3D"
else if z < -12.75 then
playSound "17", "oneshot", "3D"
end if
// localJump "ball"