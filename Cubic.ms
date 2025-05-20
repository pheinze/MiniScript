// Definiere die Dimensionen und die Position des Würfels
cubeName = "Cube(1)"
cubeWidth = 1
cubeHeight = 1
cubeDepth = 1
cubeX = 4
cubeY = 1.2
cubeZ = 5

// Definiere die Dimensionen der Kugeln
sphereWidth = 0.2
sphereHeight = 0.2
sphereDepth = 0.2

// Hilfsfunktion zum Platzieren einer Kugel an einer Ecke des Würfels
placeSphere = function(sphereName, cornerX, cornerY, cornerZ)
    moveObject sphereName, cubeX + cornerX * cubeWidth / 2, cubeY + cornerY * cubeHeight / 2, cubeZ + cornerZ * cubeDepth / 2
end function

// Skaliere und rotiere den Würfel
scaleObject cubeName, cubeWidth, cubeHeight, cubeDepth
moveObject cubeName, cubeX, cubeY, cubeZ
rotateObject cubeName, 0, 0, 0

// Platziere die Kugeln an den Ecken des Würfels
placeSphere "Sphere(1)", -1, -1, -1  // Ecke 1
placeSphere "Sphere(2)", 1, -1, -1   // Ecke 2
placeSphere "Sphere(3)", -1, 1, -1   // Ecke 3
placeSphere "Sphere(4)", 1, 1, -1    // Ecke 4
placeSphere "Sphere(5)", -1, -1, 1   // Ecke 5
placeSphere "Sphere(6)", 1, -1, 1    // Ecke 6
placeSphere "Sphere(7)", -1, 1, 1    // Ecke 7
placeSphere "Sphere(8)", 1, 1, 1     // Ecke 8

// Skaliere alle Kugeln
for i in range(1, 8)
    scaleObject "Sphere(" + str(i) + ")", sphereWidth, sphereHeight, sphereDepth
end for


/////////
//////// mit Rotation des Würfels und der  Kugeln
///////


// Definiere die Dimensionen und die Position des Würfels
cubeName = "Cube(1)"
cubeWidth = 1
cubeHeight = 1
cubeDepth = 1
cubeX = 4
cubeY = 1.2
cubeZ = 5

// Definiere die Rotation des Würfels (in Grad)
cubeRotX_deg = 0
cubeRotY_deg = rnd*360
cubeRotZ_deg = 0

// Definiere die Dimensionen der Kugeln
sphereWidth = 0.2
sphereHeight = 0.2
sphereDepth = 0.2

// Umrechnung von Grad in Radiant
deg_to_rad = pi / 180
cubeRotX_rad = cubeRotX_deg * deg_to_rad
cubeRotY_rad = cubeRotY_deg * deg_to_rad
cubeRotZ_rad = cubeRotZ_deg * deg_to_rad

// Hilfsfunktion zum Platzieren und Rotieren einer Kugel an einer Ecke des Würfels
placeAndRotateSphere = function(sphereName, cornerX, cornerY, cornerZ)
    // Berechne die unrotierten Kugelpositionen relativ zum Würfelmittelpunkt
    offsetX = cornerX * cubeWidth / 2
    offsetY = cornerY * cubeHeight / 2
    offsetZ = cornerZ * cubeDepth / 2

    // Wende die X-Rotation an
    rotatedY = offsetY * cos(cubeRotX_rad) - offsetZ * sin(cubeRotX_rad)
    rotate...tatedZ

    moveObject sphereName, finalX, finalY, finalZ
    rotateObject sphereName, 0, 0, 0  // Setze die Kugelrotation auf 0 (oder nach Bedarf)
end function

// Skaliere und Rotiere den Würfel
scaleObject cubeName, cubeWidth, cubeHeight, cubeDepth
rotateObject cubeName, cubeRotX_deg, cubeRotY_deg, cubeRotZ_deg
moveObject cubeName, cubeX, cubeY, cubeZ

// Platziere und Rotiere die Kugeln an den Ecken des Würfels
placeAndRotateSphere "Sphere(1)", -1, -1, -1  // Ecke 1
placeAndRotateSphere "Sphere(2)", 1, -1, -1   // Ecke 2
placeAndRotateSphere "Sphere(3)", -1, 1, -1   // Ecke 3
placeAndRotateSphere "Sphere(4)", 1, 1, -1    // Ecke 4
placeAndRotateSphere "Sphere(5)", -1, -1, 1   // Ecke 5
placeAndRotateSphere "Sphere(6)", 1, -1, 1    // Ecke 6
placeAndRotateSphere "Sphere(7)", -1, 1, 1    // Ecke 7
placeAndRotateSphere "Sphere(8)", 1, 1, 1     // Ecke 8

// Skaliere alle Kugeln
for i in range(1, 8)
scaleObject "Sphere(" + str(i) + ")", sphereWidth, sphereHeight, sphereDepth

end for



/////////////////////////////////////////
//Code im Objekt "Cubic2"
/////////////////////////////////////////
object1 = "cubic2"
rot = round(rnd*360) // Zufällige Rotation; abgerundete zufällige Zahl zwischen 0 und 360
rotateObject object1, rot, rot, rot
wait 2
runObjectCode "mCube(1)"