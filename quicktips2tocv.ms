// Define dictionaries with hexadecimal values
r = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
s = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
t = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
u = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
v = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
w = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}

// Generate random values for color generation
z = round(rnd+20)
k = round(rnd*15)
l = round(rnd*15)
m = round(rnd*15)
n = round(rnd*15)
o = round(rnd*15)
p = round(rnd*15)

// Combine hexadecimal values to form a color code
color = "#" + r[k] + s[l] + t[m] + u[n] + v[o] + w[p]


message = {1:"Don't produce trash..",
2:"The nature put all the medicine in the food.",
3:"Health the world!",
4:"Don't buy useless things",
5:"What else?"}


r2 = round(rnd * message.len - 1) + 1
randomcolor = "<color=" + color + ">"
title = randomcolor + "Quicktip Nr°" + r2 + "</color>"

for i in range(0, message[r2].len / 2)
t = rnd / 10
messageBox title, message[r2][:i*2]
yield
end for