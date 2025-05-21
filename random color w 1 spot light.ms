
// Define dictionaries for hexadecimal conversion
r = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}

// Loop to create and manipulate a light object
for i in range(20000, 0.1)
    // Generate random values for timing and color components
    z = round(rnd+20)
    k = round(rnd*15)
    l = round(rnd*15)
    m = round(rnd*15)
    n = round(rnd*15)
    o = round(rnd*15)
    p = round(rnd*15)
    
    // Construct a hexadecimal color code
    color = "#" + r[k]+r[l]+r[m]+r[n]+r[o]+r[p]

    // Set the light object with the generated color and other properties
    setLightObject "Spot1", color, rnd + 1, "soft", rnd
    
    // Rotate the light object over time
    rotateObject "Spot1", time*100, time*100, time*100
    
    // Move the light object to a new position
    moveObject "Spot1", k/3, l/3, m/3
    
    // Wait for a short duration before the next iteration
    wait z/10
end for


///Optimiert mit Co-Pilot

// Hex-Zeichen als Array
hex = [0,1,2,3,4,5,6,7,8,9,"A","B","C","D","E","F"]

// Funktion für zufällige Hex-Farbe
func randomHexColor
    return "#" + hex[round(rnd*15)] + hex[round(rnd*15)] + hex[round(rnd*15)] + hex[round(rnd*15)] + hex[round(rnd*15)] + hex[round(rnd*15)]
end func

for i in range(20000)
    rVal = rnd
    z = round(rVal*20)
    color = randomHexColor()
    setLightObject "Spot1", color, rVal + 1, "soft", rVal
    rotateObject "Spot1", time*100, time*100, time*100
    moveObject "Spot1", rnd*5, rnd*5, rnd*5
    wait z/10
end for