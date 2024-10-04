moveObject "eagle", -42, 20, 24
rotateObject "eagle", 0, 0, 0
radius = 21
centerX = -11
centerZ = -20
stepSize = 0.01

for angle in range(360, 0, -stepSize)
    x = centerX + radius * cos(angle)
    z = centerZ + radius * sin(angle)

    moveObject "eagle", x, 20, z

    nextAngle = angle - stepSize
    nextX = centerX + radius * cos(nextAngle)
    nextZ = centerZ + radius * sin(nextAngle)

    directionAngle = atan(nextZ - z, nextX - x)
    directionAngleDegrees = directionAngle * (180 / pi) + 90
    rotateObject "eagle", 0, -directionAngleDegrees, 0

    wait 0.01
end for