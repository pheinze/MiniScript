object1 = "cam5"

xMin = -10
xMax = 10
yMin = 2
yMax = 4
zMin = -14
zMax = 14

x = xMin + rnd * (xMax - xMin)
y = yMin + rnd * (yMax - yMin)
z = zMin + rnd * (zMax - zMin)
moveObject object1 , x , y , z

for i in range(12000)
    x2 = xMin + rnd * (xMax - xMin)
    y2 = yMin + rnd * (yMax - yMin)
    z2 = zMin + rnd * (zMax - zMin)
    angle = atan(z2-z, x2-x) * 90 / pi
    steps = round(rnd*50, 0.01) + 50
    for j in range(steps)
        x = x + (x2 - x) / steps
        y = y + (y2 - y) / steps
        z = z + (z2 - z) / steps
        moveObject object1 , x , y , z
        rotateObject object1 , 0 , angle , 0
        wait 0.001
        end for
end for
