moveObject "fire1", 0, 15, -30
moveObject "fire2", 0, 15, -30
moveObject "fire3", 0, 15, -30
while true
    rotateObject "fire1", 0, rnd*360, 0
    rotateObject "fire2", 0, rnd*360, 0
    rotateObject "fire3", 0, rnd*360, 0
    scaleObject "fire1", rnd / 10 + 15, rnd / 10 + 15, rnd / 10 + 15
    scaleObject "fire2", rnd / 10 + 15, rnd / 10 + 15, rnd / 10 + 15
    scaleObject "fire3", rnd / 10 + 15, rnd / 10 + 15, rnd / 10 + 15
    if time > 10 then break
    end while

    