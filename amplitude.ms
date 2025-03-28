object1 = "Sphere(1)"
x = 1
y = 2
z = 3
amplitude = 0.1
frequency = 4
while true
    newY = y + amplitude * sin(frequency * time)
    newX = x + amplitude * cos(frequency * time)
    moveObject object1, newX, newY, z
    wait 0.01
end while
