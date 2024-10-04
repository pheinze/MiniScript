r = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
s = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
t = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
u = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
v = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
w = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}

// List for the hexadecimal system

for i in range(20000, 0.1)
z = round(rnd+20)
k = round(rnd*15)
l = round(rnd*15)
m = round(rnd*15)
n = round(rnd*15)
o = round(rnd*15)
p = round(rnd*15)
color = "#" + r[k]+s[l]+t[m]+u[n]+v[o]+w[p]

setLightObject "Spot1", color, rnd + 1, "soft", rnd
rotateObject "Spot1",time*100, time*100, time*100
moveObject "Spot1", k/3, l/3, m/3
wait z/10
end for

// This script will generate a random hex color and a random LightStrenght (between 1 and 2) and a random ShadowStrenght (between 0 and 1).
// Set a SpotLightObject and name it "Spot1". The area where the spot light moves is a area of 16 / 3. So change this line as you want.
// wait z/10 will makes a random time where the spot is changing.
