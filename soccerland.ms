y = 8.2
yb = 8.7
yballSpot = 12
xMin = 5.5
xMax = 25
zMin = 10
zMax = 38

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
ycam4 = 10
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
if x > 23.7 then
playSound "12", "oneshot", "2D"
else if x < 6.2 then
playSound "12", "oneshot", "3D"
else if z > 37 then
playSound "17", "oneshot", "3D"
else if z < 11.3 then
playSound "17", "oneshot", "3D"
end if
// localJump "ball"

///////
// Konstanten
y = 8.2
yb = 8.7
yballSpot = 12
xMin = 5.5
xMax = 25
zMin = 10
zMax = 38

// Zufallswerte berechnen
rx = rnd * 360
ry = rnd * 360
rz = rnd * 360
t = rnd * 3 + 0.5
t2 = t - 0.5
x = xMin + rnd * (xMax - xMin)
z = zMin + rnd * (zMax - zMin)

// Spot-Positionen berechnen
offset = 5  // Gemeinsamer Offset für Spot-Positionen
xSpot1 = x - offset
zSpot1 = z - offset
xSpot2 = x + offset
zSpot2 = z + offset
xSpot3 = x - offset
zSpot3 = z + offset
xSpot4 = x + offset
zSpot4 = z + offset

// Cam4-Position berechnen
xcam4 = x + offset
ycam4 = 10
zcam4 = z

// Datenstrings erstellen
createDataString = function(x, y, z, t)
    return "" + x + "," + y + "," + z + "," + t
end function

sData = createDataString(x, y, z, t)
sDataB = createDataString(x, yb, z, t)
sDataBJump = createDataString(x, yb, z, 0.1)
rData = createDataString(rx, ry, rz, t)
spot1 = createDataString(xSpot1, yballSpot, zSpot1, t)
spot2 = createDataString(xSpot2, yballSpot, zSpot2, t)
spot3 = createDataString(xSpot3, yballSpot, zSpot3, t)
spot4 = createDataString(xSpot4, yballSpot, zSpot4, t)
cam4 = createDataString(xcam4, ycam4, zcam4, t2)

// Befehle ausführen
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

wait t

if x > 23.7 then
    playSound "12", "oneshot", "2D"
else if x < 6.2 then
    playSound "12", "oneshot", "3D"
else if z > 37 then
    playSound "17", "oneshot", "3D"
else if z < 11.3 then
    playSound "17", "oneshot", "3D"
end if

// localJump "ball"
 