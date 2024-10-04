object1 = "tennis_ball"

r = round(rnd * 1)
y = 1.45 + rnd * 2
xMin = 115
xMax = 140
zMin = -30
zMax = -18

rx = rnd*360
ry = rnd*360
rz = rnd*360


tx = rnd * (xMax - xMin)
tz = rnd * (zMax - zMin)

x = xMin + tx
z = zMin + tz
x2 = xMin + tx / 2
z2 = zMin + tz / 2
sData = "" + 127.5 + "," + y + "," + z + "," + 1
rData = "" + rx + "," + ry + "," + rz + "," + 1
sData2 = "" + x + "," + 0.03 + "," + z + "," + 1
rData2 = "" + rx + "," + ry + "," + rz + "," + 1

networkCommand object1, "moveObject", sData
networkCommand object1, "rotateObject", rData
wait
networkCommand object1, "moveObject", sData2
networkCommand object1, "rotateObject", rData2

if x < 116.6 then
    playSound "22", "oneshot", "3D"
else if x > 139.86 then
    playSound "24", "oneshot", "3D"
else if z > -19.9 then
    playSound "17", "oneshot", "3D"
else if z > -28.1 then
    playSound "19", "oneshot", "3D"
end if
