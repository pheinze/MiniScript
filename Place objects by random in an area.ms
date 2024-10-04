wait 1
object1 = "bitcoin"
y = 0.15
xMin = -14
xMax = 14
zMin = -10
zMax = 10


while time <= 2
ry = time*time*time*time
rotateObject object1, 0, ry, 0
end while 

playSound "22", "oneshot", "2D"
x = xMin + rnd * (xMax - xMin)
z = zMin + rnd * (zMax - zMin)

sData = "" + x + "," + y + "," + z + "," + 0.001
networkCommand object1, "moveObject", sData
