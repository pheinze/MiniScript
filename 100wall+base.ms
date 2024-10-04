object1 = "Wall"
object2 = "Base"
object3 = "Image"

for i in range(100)
  
    rx = 0; ry = round(rnd*20); rz = 0
    sx = 5 + round(rnd*5); sy = 4 ; sz = 0.1
    x = i *5;y = sy / 2;z = 0
    moveObject object1 + i, x  , y, z
    rotateObject object1 + i, rx, ry, rz
    scaleObject object1 + i, sx , sy, sz
    
    moveObject object2 + i, x, y /2 - y/2, z
    rotateObject object2 + i, rx, ry, rz
    scaleObject object2 + i, sx + 0.2 , sy/20, sz + 0.2
    
    moveObject object3 + i, x, y, z + sz*2
    rotateObject object3 + i, rx, ry, rz
    scaleObject object3 + i, sx/pi , sy/pi, sz / 10
    // wait 0.2
end for