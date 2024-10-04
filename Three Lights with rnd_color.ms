// Define dictionaries with hexadecimal values
r = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
s = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
t = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
u = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
v = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
w = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}

// Define a function to generate a random color
getRandomColor = function()
    // Generate random values for color generation
    z = round(rnd+20)
    k = round(rnd*15)
    l = round(rnd*15)
    m = round(rnd*15)
    n = round(rnd*15)
    o = round(rnd*15)
    p = round(rnd*15)

    // Combine hexadecimal values to form a color code
    color = "#" + r[k]+s[l]+t[m]+u[n]+v[o]+w[p]

    return color
end function

for i in range(20, 1)
    // Generate three random colors
    color1 = getRandomColor()
    color2 = getRandomColor()
    color3 = getRandomColor()


    // Set the light objects with the generated colors
    setLightObject "Light1", color1, rnd + 0.5, "hard", 0
    setLightObject "Light2", color2, rnd + 0.5, "hard", 0
    setLightObject "Light3", color3, rnd + 0.5, "hard", 0

    // Rotate the light objects
    rotateObject "Light1",time*100, time*100, 0
    rotateObject "Light2",time*100, time*100, 0
    rotateObject "Light3",time*100, time*100, 0

    // Wait for a random time
    wait rnd
end for

networkCommand "10-1", "moveObject", "38.6, 2.6, -13, 1"
networkCommand "10-2", "moveObject", "38.2, 1.9, -11.75, 1"
networkCommand "10-1", "scaleObject", "3.2, 3.2, 0.01, 1"
networkCommand "10-2", "scaleObject", "1.8, 1.8, 0.01, 1"

networkCommand "10-1", "moveObject", "38.6 - 1.8, 2.6, -13, 1"
networkCommand "10-2", "moveObject", "38.2 - 0.9, 1.9, -11.75, 1"
networkCommand "10-1", "scaleObject", "0.1, 0.1, 0.01, 1"
networkCommand "10-2", "scaleObject", "0.1, 0.1, 0.01, 1"