y = 0.85
xMin = -6.2
xMax = 1
zMin = -1.5
zMax = -4.2

rx = rnd*360
ry = rnd*360
rz = rnd*360

x = xMin + rnd * (xMax - xMin)
z = zMin + rnd * (zMax - zMin)
sData = "" + x + "," + y + "," + z + "," + 2
rData = "" + rx + "," + ry + "," + rz + "," + 2
networkCommand "matrix_dice", "moveObject", sData
networkCommand "matrix_dice", "rotateObject", rData
