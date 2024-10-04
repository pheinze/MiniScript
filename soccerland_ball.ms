y = 0.15
yb = 0.115
yballSpot = 4
xMin = -10
xMax = 10
zMin = -14
zMax = 14

rx = rnd*3600
ry = rnd*3600
rz = rnd*3600
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
xcam1 = x + 5
ycam1 = 2
zcam1 = z
sData = "" + x + "," + y + "," + z + "," + t
sDataB = "" + x + "," + yb + "," + z + "," + t
sDataBJump = "" + x + "," + yb + "," + z + "," + 0.1
rData = "" + rx + "," + ry + "," + rz + "," + t
spot1 = "" + xSpot1 + "," + yballSpot + "," + zSpot1 + "," + t
spot2 = "" + xSpot2 + "," + yballSpot + "," + zSpot2 + "," + t
spot3 = "" + xSpot3 + "," + yballSpot + "," + zSpot3 + "," + t
spot4 = "" + xSpot4 + "," + yballSpot + "," + zSpot4 + "," + t
cam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
runObjectCode "ballSound_trigger"
networkCommand "ball", "moveObject", sData
networkCommand "ball_trigger", "moveObject", sDataB
// networkCommand "ball", "rotateObject", rData
// networkCommand "ballSpot1", "moveObject", spot1
// networkCommand "ballSpot2", "moveObject", spot2
// networkCommand "ballSpot3", "moveObject", spot3
// networkCommand "ballSpot4", "moveObject", spot4
// networkCommand "ball_trigger_jump", "moveObject", sDataBJump
// networkCommand "ball_trigger_jump_pos", "moveObject", sDataBJump
networkCommand "cam1", "moveObject", cam1
// wait 0.1
// networkCommand "ball_trigger_jump", "scaleObject", "50, 50, 50, 0.01"
// wait 0.01
// networkCommand "ball_trigger_jump", "scaleObject", "0.1, 0.1, 0.1, 0.01"
while time < t
rotateObject "ball", rx, ry, rz
wait 0.01
end while
if x > xMax -1.25 then
playSound "12", "oneshot", "2D"
else if x < xMin + 1.25 then
playSound "12", "oneshot", "3D"
else if z > zMax - 1.25 then
playSound "17", "oneshot", "3D"
else if z < xMin +1.25 then
playSound "17", "oneshot", "3D"
end if
// localJump "ball"


//
y = 0.15
yb = 0.115
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
// xcam1 = x + 5
// ycam1 = 2
// zcam1 = z
sData = "" + x + "," + y + "," + z + "," + t
sDataB = "" + x + "," + yb + "," + z + "," + t
sDataBJump = "" + x + "," + yb + "," + z + "," + 0.1
rData = "" + rx + "," + ry + "," + rz + "," + t
spot1 = "" + xSpot1 + "," + yballSpot + "," + zSpot1 + "," + t
spot2 = "" + xSpot2 + "," + yballSpot + "," + zSpot2 + "," + t
spot3 = "" + xSpot3 + "," + yballSpot + "," + zSpot3 + "," + t
spot4 = "" + xSpot4 + "," + yballSpot + "," + zSpot4 + "," + t
// cam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
networkCommand "ballSound_trigger", "scaleObject", "100, 100, 100, 0.001"
networkCommand "ballRoll_trigger", "scaleObject", "100, 100, 100, 0.001"
wait 0.001
networkCommand "ballSound_trigger", "scaleObject", "1, 1, 1, 0.001"
networkCommand "ballRoll_trigger", "scaleObject", "1, 1, 1, 0.001"
//runObjectCode "ballSound_trigger"
networkCommand "ball", "moveObject", sData
networkCommand "ball_trigger", "moveObject", sDataB

// Cam1 Rotation
rndRotCam = round(rnd*3)
if rndRotCam == 0 then
    xcam1 = x + 5
    ycam1 = 2
    zcam = z
    poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
    rotcam1 = "" + 10 + "," 270 + "," + 0 + "," + t2
else if rndRotCam == 1 then
    xcam1 = x
    ycam1 = 2
    zcam = z + 5
    poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
    rotcam1 = "" + 10 + "," 180 + "," + 0
else if rndRotCam == 1 then
    xcam1 = x - 5
    ycam1 = 2
    zcam = z
    poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
    rotcam1 = "" + 10 + "," 90 + "," + 0
else if rndRotCam == 1 then
    xcam1 = x
    ycam1 = 2
    zcam = z - 5
    poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
    rotcam1 = "" + 10 + "," 0 + "," + 0
end if
networkCommand "cam1", "moveObject", poscam1
networkCommand "cam1", "rotateObject", rotcam1
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


//ballRoll_trigger
rx = rnd*360
ry = rnd*360
rz = rnd*360
t = rnd*3 + 0.5
while time <= t
    rotateObject "ball", rx*time*t, ry*time*t, rz*time*t
    wait 0.01
end while
////
rndRotCam = round(rnd*3)
if rndRotCam == 0 then
    xcam1 = x + 5
    ycam1 = 2
    zcam = z
    poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
    rotcam1 = "" + 10 + "," + 270 + "," + 0 + "," + t2
else if rndRotCam == 1 then
    xcam1 = x
    ycam1 = 2
    zcam = z + 5
    poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
    rotcam1 = "" + 10 + "," + 180 + "," + 0
else if rndRotCam == 1 then
    xcam1 = x - 5
    ycam1 = 2
    zcam = z
    poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
    rotcam1 = "" + 10 + "," + 90 + "," + 0
else if rndRotCam == 1 then
    xcam1 = x
    ycam1 = 2
    zcam = z - 5
    poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
    rotcam1 = "" + 10 + "," + 0 + "," + 0
end if

/////////////////////////////////////////////////////////////
y = 0.15
yb = 0.115
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

sData = "" + x + "," + y + "," + z + "," + t
sDataB = "" + x + "," + yb + "," + z + "," + t
sDataBJump = "" + x + "," + yb + "," + z + "," + 0.1
rData = "" + rx + "," + ry + "," + rz + "," + t
networkCommand "ballSound_trigger", "scaleObject", "100, 100, 100, 0.001"
networkCommand "ballRoll_trigger", "scaleObject", "100, 100, 100, 0.001"
wait 0.001
networkCommand "ballSound_trigger", "scaleObject", "1, 1, 1, 0.001"
networkCommand "ballRoll_trigger", "scaleObject", "1, 1, 1, 0.001"

networkCommand "ball", "moveObject", sData
networkCommand "ball_trigger", "moveObject", sDataB

rndRotCam = round(rnd*3)
if rndRotCam == 0 then
    xcam1 = x + 5
    ycam1 = 2
    zcam1 = z
    poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
    rotcam1 = "" + 10 + "," + 270 + "," + 0 + "," + t2
else if rndRotCam == 1 then
    xcam1 = x
    ycam1 = 2
    zcam1 = z + 5
    poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
    rotcam1 = "" + 10 + "," + 180 + "," + 0 + "," + t2
else if rndRotCam == 2 then
    xcam1 = x - 5
    ycam1 = 2
    zcam1 = z
    poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
    rotcam1 = "" + 10 + "," + 90 + "," + 0 + "," + t2
else if rndRotCam == 3 then
    xcam1 = x
    ycam1 = 2
    zcam1 = z - 5
    poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
    rotcam1 = "" + 10 + "," + 0 + "," + 0 + "," + t2
end if

networkCommand "cam1", "moveObject", poscam1
networkCommand "cam1", "rotateObject", rotcam1
wait t

if x < -8.75 then
    refereeData = "" + (x - rnd*0.5) + "," + (0.6) + "," + (z - 1 + rnd*2) + "," + rnd
    rotaterefereeData = "" + 0 + "," + (240 + rnd*60) + "," + 0 + "," + 0.1
    networkCommand "woman_referee", "moveObject", refereeData
    networkCommand "woman_referee", "rotateObject", rotaterefereeData
    networkCommand "offsiteSound_trigger", "scaleObject", "100, 100, 100, 0.001"
    wait 0.001
    networkCommand "offsiteSound_trigger", "scaleObject", "1, 1, 1, 0.001"

else if x > 8.75 then
    refereeData = "" + (x - rnd*0.5) + "," + (0.6) + "," + (z - 1 + rnd*2) + "," + rnd
    rotaterefereeData = "" + 0 + "," + (60 + rnd*60) + "," + 0 + "," + 0.1
    networkCommand "woman_referee", "moveObject", refereeData
    networkCommand "woman_referee", "rotateObject", rotaterefereeData
    networkCommand "offsiteSound_trigger", "scaleObject", "100, 100, 100, 0.001"
    wait 0.001
    networkCommand "offsiteSound_trigger", "scaleObject", "1, 1, 1, 0.001"
else if z < -12.75 then
    if x > 1 or x < -1 then
        refereeData = "" + (x - rnd*0.5) + "," + (0.6) + "," + (z - 1 + rnd*2) + "," + rnd
        rotaterefereeData = "" + 0 + "," + (150 + rnd*60) + "," + 0 + "," + 0.1
        networkCommand "woman_referee", "moveObject", refereeData
        networkCommand "woman_referee", "rotateObject", rotaterefereeData
        networkCommand "offsiteSound_trigger", "scaleObject", "100, 100, 100, 0.001"
        wait 0.001
        networkCommand "offsiteSound_trigger", "scaleObject", "1, 1, 1, 0.001"
    else if x < 1 or x > - 1 then
        networkCommand "Goal1Sound_trigger", "scaleObject", "100, 100, 100, 0.001"
        wait 0.001
        networkCommand "Goal1Sound_trigger", "scaleObject", "1, 1, 1, 0.001"
    end if
else if z > 12.75 then
    if x > 1 or x < -1 then
        refereeData = "" + (x - rnd*0.5) + "," + (0.6) + "," + (z - 1 + rnd*2) + "," + rnd
        rotaterefereeData = "" + 0 + "," + (330 + rnd*60) + "," + 0 + "," + 0.1
        networkCommand "woman_referee", "moveObject", refereeData
        networkCommand "woman_referee", "rotateObject", rotaterefereeData
        networkCommand "offsiteSound_trigger", "scaleObject", "100, 100, 100, 0.001"
        wait 0.001
        networkCommand "offsiteSound_trigger", "scaleObject", "1, 1, 1, 0.001"
    else if x < 1 or x > - 1 then
        networkCommand "Goal2Sound_trigger", "scaleObject", "100, 100, 100, 0.001"
        wait 0.001
        networkCommand "Goal2Sound_trigger", "scaleObject", "1, 1, 1, 0.001"
    end if
end if

////////////////////////////////////////////////////////////////////
//ballRoll_trigger
rx = rnd*360
ry = rnd*360
rz = rnd*360
t = rnd*3 + 0.5
while time <= t
    rotateObject "ball", rx*time*t, ry*time*t, rz*time*t
    wait 0.01
end while

//
//

rndRotCam = round(rnd*3)
if rndRotCam == 0 then
    xcam1 = x + 5
    ycam1 = 2
    zcam = z
    poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
    rotcam1 = "" + 10 + "," 270 + "," + 0 + "," + t2
else if rndRotCam == 1 then
    xcam1 = x
    ycam1 = 2
    zcam = z + 5
    poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
    rotcam1 = "" + 10 + "," 180 + "," + 0
else if rndRotCam == 1 then
    xcam1 = x - 5
    ycam1 = 2
    zcam = z
    poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
    rotcam1 = "" + 10 + "," 90 + "," + 0
else if rndRotCam == 1 then
    xcam1 = x
    ycam1 = 2
    zcam = z - 5
    poscam1 = "" + xcam1 + "," + ycam1 + "," + zcam1 + "," + t2
    rotcam1 = "" + 10 + "," 0 + "," + 0
end if
    