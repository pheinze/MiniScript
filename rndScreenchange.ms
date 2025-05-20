x = 1.6 * 3
y = 0.9 * 3
z = 0.01 * 3

while true
    r = round(rnd*4)
    if r == 0 then
        scaleObject "view1", x, y, z
        scaleObject "view2", x * 0.9, y * 0.9, z * 0.9
        scaleObject "view3", x * 0.9, y * 0.9, z * 0.9
        scaleObject "view4", x * 0.9, y * 0.9, z * 0.9
        scaleObject "view5", x * 0.9, y * 0.9, z * 0.9
    else if r == 1 then
        scaleObject "view1", x * 0.9, y * 0.9, z * 0.9
        scaleObject "view2", x, y, z
        scaleObject "view3", x * 0.9, y * 0.9, z * 0.9
        scaleObject "view4", x * 0.9, y * 0.9, z * 0.9
        scaleObject "view5", x + 0.9, y * 0.9, z * 0.9
    else if r == 2 then
        scaleObject "view1", x * 0.9, y * 0.9, z * 0.9
        scaleObject "view2", x * 0.9, y * 0.9, z * 0.9
        scaleObject "view3", x, y, z
        scaleObject "view4", x * 0.9, y * 0.9, z * 0.9
        scaleObject "view5", x * 0.9, y * 0.9, z * 0.9
    else if r == 3 then
        scaleObject "view1", x * 0.9, y * 0.9, z * 0.9
        scaleObject "view2", x * 0.9, y * 0.9, z * 0.9
        scaleObject "view3", x * 0.9, y * 0.9, z * 0.9
        scaleObject "view4", x, y, z
        scaleObject "view5", x * 0.9, y * 0.9, z * 0.9
    else if r == 4 then
        scaleObject "view1", x * 0.9, y * 0.9, z * 0.9
        scaleObject "view2", x * 0.9, y * 0.9, z * 0.9
        scaleObject "view3", x * 0.9, y * 0.9, z * 0.9
        scaleObject "view4", x * 0.9, y * 0.9, z * 0.9
        scaleObject "view5", x, y, z
    end if
    wait round(rnd*6) +4
end while

// Optimized version of the code
// Konstanten
baseScale = 0.9
animationScale = 1.6 * 3
animationTime = 4
scaleZ = 0.01 * 3
objects = ["view1", "view2", "view3", "view4", "view5"]

// Funktion zum Skalieren eines Objekts
scaleView = function(object, scaleFactor)
  scaleObject object, animationScale * scaleFactor, animationScale * scaleFactor, scaleZ
end function

while true
  r = round(rnd * 4)
  for i in range(0, objects.len - 1)
    if i == r then
      scaleView(objects[i], 1)
    else
      scaleView(objects[i], baseScale)
    end if
  end for
  scaleView(objects[objects.len], 1)
  wait round(rnd * 6) + animationTime
end while
 