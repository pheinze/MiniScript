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
sData = "" + x + "," + y + "," + z + "," + 2 // Converts the numbers to a string
// and concatenates them with commas
// to create a single string
// for the network command
rData = "" + rx + "," + ry + "," + rz + "," + 2

networkCommand "matrix_dice", "moveObject", sData // Sends the position data
networkCommand "matrix_dice", "rotateObject", rData // Sends the rotation data
