// trigger_coke1
x = 50.06
y = 1.342
z = -20.5
moveObject "coke_can", x, y, z
rotateObject "coke_can", 0, 0, 90
playSound "44", "oneshot", "3D"
wait
for i in range(0,1.19,0.04)
moveObject "coke_can", x + sin(i), y -1 + cos(i), z  + sin(i)
rotateObject "coke_can", 0, time*222, 90
wait 0.001
end for

moveObject "trigger_coke1", 50, -1.342, -20.5
moveObject "trigger_coke2", 51, 0.75, -19.5

// trigger_coke2
moveObject "trigger_coke2", 51, -0.75, -19.5