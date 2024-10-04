/// Nav Menu Open
navOpen = function()

object1 = "button_hall-1"
object2 = "button_hall-2"
object3 = "button_soccer-field"
object4 = "button_tennis-court"
object5 = "button_nav-open"
object6 = "button_nav-close"

x = 49.4
y = 2.7
z = 7.6
sx = 0.454
sy = 0.198
sz = 0.1


scaleObject object5, 0.374, 0.198, 0.1
scaleObject object6, 0.374, 0.198, 0.01

for i in range(0, 1, 0.01)
moveObject object4, x + i + 2.4, y , z
scaleObject object4, sx + 0.404, sy, sz
end for

for i in range(0,1, 0.01)
    moveObject object3, x + i + 1.4, y , z
    scaleObject object3, sx + 0.338, sy, sz
end for

for i in range(0, 1, 0.01)
    moveObject object2, x + i + 0.6, y , z
    scaleObject object2, sx + 0.14, sy, sz
end for
    
for i in range(0, 1, 0.01)
    moveObject object1, x + i, y , z
    scaleObject object1, sx, sy, sz
end for

end function
navOpen

/// Nav Menu Close
navClose = function()

object1 = "button_hall-1"
object2 = "button_hall-2"
object3 = "button_soccer-field"
object4 = "button_tennis-court"
object5 = "button_nav-open"
object6 = "button_nav-close"

x = 49.4
y = 2.7
z = 7.6
sx = 0.01
sy = 0.01
sz = 0.01

scaleObject object5, 0.374, 0.198, 0.01
scaleObject object6, 0.374, 0.198, 0.1

for j in range (20)
    r = round(rnd*3)
    if r == 0 then
        for i in range(0, 1, 0.01)
        moveObject object1, x - i, y , z
        scaleObject object1, sx, sy, sz
        end for
    else if r == 1 then
        for i in range(0, 1, 0.01)
            moveObject object2, x - i + 0.6, y , z
            scaleObject object2, sx, sy, sz
        end for
    else if r == 2 then
        for i in range(0,1, 0.01)
            moveObject object3, x - i + 1.4, y , z
            scaleObject object3, sx, sy, sz
        end for
    else if r == 3 then
        for i in range(0, 1, 0.01)
            moveObject object4, x + i + 2.4, y , z
            scaleObject object4, sx, sy, sz
        end for
    end if
end for
end function
navClose


// no need
random = (rnd)
if random >0.2 then
    navOpen
else if random < 0.2 then
    navClose
end if