
// This script moves an object in a circular path counter-clockwise
// around a specified center point in a 3D environment.
// The object will rotate to face the direction of movement.
moveObject "eagle", -42, 20, 24
rotateObject "eagle", 0, 0, 0
radius = 21
centerX = -11
centerZ = -20
stepSize = 0.01

// Loop to move the object in a circular path
for angle in range(360, 0, -stepSize)
    x = centerX + radius * cos(angle)
    z = centerZ + radius * sin(angle)

    moveObject "eagle", x, 20, z
// Calculate the next position to determine the direction
    nextAngle = angle - stepSize
    nextX = centerX + radius * cos(nextAngle)
    nextZ = centerZ + radius * sin(nextAngle)
// Calculate the direction angle
    // The atan function returns the angle in radians
    directionAngle = atan(nextZ - z, nextX - x)
    directionAngleDegrees = directionAngle * (180 / pi) + 90
    
// Rotate the object to face the direction of movement
    rotateObject "eagle", 0, -directionAngleDegrees, 0 

    wait 0.01
end for