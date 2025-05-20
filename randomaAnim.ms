object1 = "aAnim5"
x = 11
y = 0.001
z = -1.5
roty = 250

rndsteps = round(rnd*6)
for i in range(0,rndsteps,1)
    rndtime = round(rnd*4) + 2
    pz = z + rnd*3.5
    ry = roty + rnd*40
    moveObject object1, x, y, pz
    rotateObject object1, 0, ry, 0
    rndAnimation = {0:2,1:3,2:4,3:5,4:8,5:18,6:21,7:25,8:32,9:33,10:34,11:35,12:41,13:42,14:43,15:44,16:79,17:80,18:81,19:82,20:84,21:85,22:86,23:87,24:88,25:89,26:90,27:91,28:92,29:93,30:94,31:95,32:98,33:99,34:101}
    customAvatarAnim object1, rndAnimation[round(rnd*rndAnimation.len)]
    wait rndtime
end for