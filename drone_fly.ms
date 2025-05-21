//Move objects by random in an area

y = 12 // height of the drone

//Area of the random movement
xMin = -56
xMax = 56
zMin = -292
zMax = -56

//Random number generator
x = xMin + rnd * (xMax - xMin)
z = zMin + rnd * (zMax - zMin)
moveObject "drone" , x , y , z

//Main loop
for i in range(12000)
    x2 = xMin + rnd * (xMax - xMin)
    z2 = zMin + rnd * (zMax - zMin)
    angle = atan(z2-z, x2-x) * 90 / pi
    for j in range(100)
        x = x + (x2 - x) / 100
        z = z + (z2 - z) / 100
        moveObject "drone" , x , y , z
        rotateObject "drone" , 0 , angle , 0
        wait 0.01
    end for
end for
