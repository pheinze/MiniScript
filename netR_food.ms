object1 = "grill_chicken"
switch = round(rnd*4)

if switch == 0 then
r = round(rnd*50)
playSound r, "oneshot", "2D"
wait 0.2
networkCommand object1, "scaleObject", "0, 0, 0, 0.1"
wait 10
networkCommand object1, "scaleObject", "0.2, 0.2, 0.2, 4"
else if switch >= 1 then
rx = 0
ry = rnd*12 * 30
rz = 0

rData = "" + rx + "," + ry + "," + rz + "," + 0.1
networkCommand object1, "rotateObject", rData
end if