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



//home/pat/Assets/Web3Done/MiniScript/flying_camera 2.ms

object1 = "cam5"
x = 0
y = 2
z = -14

while true
r = round(rnd*1)

if r == 0 then
xMin = -10
xMax = 10
yMin = 1
yMax = 6
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
    angleY = atan(z2-z, x2-x) * 90 / pi
    angleX = (y - 1) * 50 / 5 - 10 

    steps = round(rnd*50, 0.01) + 50
    for j in range(steps)
        x = x + (x2 - x) / steps
        y = y + (y2 - y) / steps
        z = z + (z2 - z) / steps
        moveObject object1 , x , y , z

        angleX = (y - 1) * 50 / 5 - 10 

        rotateObject object1 , angleX , angleY , 0  
        wait 0.001
        end for
end for
else if r == 1 then
moveObject object1, x , y , z
rotateObject object1, 0, 0, 0
end if
wait 60
end while

// Helper function to clamp a value between a minimum and maximum
function clamp(value, min, max)
    if value < min then
        return min
    else if value > max then
        return max
    else
        return value
    end if
end function
