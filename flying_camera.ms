//Move objects by random in an area
object1 = "cam5"
x = 0
y = 2
z = -14

while true
r = round(rnd*1)

if r == 0 then
xMin = -10
xMax = 10
zMin = -14
zMax = 10

x = xMin + rnd * (xMax - xMin)
z = zMin + rnd * (zMax - zMin)
moveObject object1 , x , y , z

for i in range(120)
    x2 = xMin + rnd * (xMax - xMin)
    z2 = zMin + rnd * (zMax - zMin)
    angle = atan(z2-z, x2-x) * 90 / pi
    for j in range(100)
        x = x + (x2 - x) / 100
        z = z + (z2 - z) / 100
        moveObject object1 , x , y , z
        rotateObject object1 , 0 , angle + time , 0
        wait 0.01
    end for
end for
else if r == 1 then
moveObject object1, x , y , z
rotateObject object1, 0, 0, 0
end if
wait 60
end while




object1 = "cam5"
x = 0
y = 2
z = -14

while true
r = round(rnd*1)

if r == 0 then
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

for i in range(120)
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
else if r == 1 then
moveObject object1, x , y , z
rotateObject object1, 0, 0, 0
end if
wait 60
end while