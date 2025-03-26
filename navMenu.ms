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

////
// Objekt- und Animationseinstellungen
objects = [
  { name: "button_hall-1",   xOffset: 0,   scaleXOffset: 0   },
  { name: "button_hall-2",   xOffset: 0.6, scaleXOffset: 0.6 },
  { name: "button_soccer-field", xOffset: 1.4, scaleXOffset: 1.4 },
  { name: "button_tennis-court", xOffset: 2.4, scaleXOffset: 2.4 }
]
navButton = [
  { name: "button_nav-open",  scaleZ: 0.01 },
  { name: "button_nav-close", scaleZ: 0.1  }
]
animation = {
  y: 2.7,
  z: 7.6,
  scaleY: 0.198,
  scaleZ: 0.1,
  x: 49.4
}

// Funktion zum Bewegen und Skalieren von Objekten
animateObject = function(name, x, y, z, scaleX, scaleY, scaleZ)
  moveObject name, x, y, z
  scaleObject name, scaleX, scaleY, scaleZ
end function

// Nav Menu öffnen
navOpen = function()
  for obj in navButton
    animateObject obj.name, animation.x, animation.y, animation.z, 0.374, animation.scaleY, obj.scaleZ
  end for
  for obj in objects
    for i in range(0, 1, 0.01)
      animateObject obj.name, animation.x + i + obj.scaleXOffset, animation.y, animation.z, 0.454, animation.scaleY, animation.scaleZ
    end for
  end for
end function

// Nav Menu schließen
navClose = function()
  for obj in navButton
    animateObject obj.name, animation.x, animation.y, animation.z, 0.374, animation.scaleY, obj.scaleZ
  end for
  for j in range(20)
    r = round(rnd * 3)
    for i in range(0, 1, 0.01)
      animateObject objects[r].name, animation.x - i + objects[r].xOffset, animation.y, animation.z, 0.01, 0.01, 0.01
    end for
  end for
end function

// Navigationssteuerung
if rnd > 0.2 then
  navOpen()
else
  navClose()
end if
 