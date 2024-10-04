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