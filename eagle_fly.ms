// Initialize eagle
objectName = "eagle" 
moveObject objectName, 0, 20, 0
rotateObject objectName, 0, 0, 0

// Figure-eight parameters
radius = 10
centerX1 = -radius / 2 
centerX2 = radius / 2  
centerZ = 0
stepSize = 0.1

// Function to move and rotate the eagle
function moveAndRotate(centerX) {
  for angle in range(0, 360, stepSize)
    x = centerX + radius * cos(angle)
    z = centerZ + radius * sin(angle)
    moveObject objectName, x, 20, z
    rotateObject objectName, 0, -angle * 180 / pi, 0
    wait 0.01
}

// Fly the figure-eight pattern
moveAndRotate(centerX1) // First circle
moveAndRotate(centerX2) // Second circle
moveAndRotate(centerX3) // Third circle
moveAndRotate(centerX4) // Fourth circle
moveAndRotate(centerX5) // Fifth circle



// Initialize eagle
objectName = "eagle" 
moveObject objectName, 0, 20, 0
rotateObject objectName, 0, 0, 0

// Figure-eight parameters
radius = 10
centerX = 0
centerZ = 0
stepSize = 0.1

// Function to move and rotate the eagle
function moveAndRotate(centerX) {
  for angle in range(0, 360, stepSize)
    x = centerX + radius * cos(angle)
    z = centerZ + radius * sin(angle)
    moveObject objectName, x, 20, z
    rotateObject objectName, 0, -angle * 180 / pi, 0
    wait 0.01
}

// Fly the figure-eight pattern
moveAndRotate(centerX - radius / 2) // First circle
moveAndRotate(centerX + radius / 2) // Second circle
moveAndRotate(centerX - radius / 2) // Third circle
moveAndRotate(centerX + radius / 2) // Fourth circle
moveAndRotate(centerX - radius / 2) // Fifth circle


// Initialize eagle
objectName = "eagle" 
moveObject objectName, 0, 20, 0
rotateObject objectName, 0, 0, 0

// Figure-eight parameters
radius = 10
centerX1 = -radius / 2 
centerX2 = radius / 2  
centerZ = 0
stepSize = 0.1

// Function to move and rotate the eagle
function moveAndRotate(centerX) {
  for angle in range(0, 360, stepSize)
    x = centerX + radius * cos(angle)
    z = centerZ + radius * sin(angle)
    moveObject objectName, x, 20, z
    rotateObject objectName, 0, -angle * 180 / pi, 0
    wait 0.01
}

// Fly the figure-eight pattern
for i in range(5)
  if i % 2 == 0
    moveAndRotate(centerX1)
  else
    moveAndRotate(centerX2)
