length = 6
width = 12
height = 4
thickness = 0.1
baseheight = 0.15
basedepth = 0.2
positionx = 2
positiony = 0
positionz = 6
rotationx = 0
rotationy = 20
rotationz = 0

object1 = "Floor1"
object2 = "Wall1a"
object3 = "Wall1b"
object4 = "Wall1c"
object5 = "Image1"
object6 = "Image2"
object7 = "Image3"

// define a constant for the rotation angle in radians
angle = rotationy * pi / 180
// precompute the cosine and sine of the angle
cos = cos(angle)
sin = sin(angle)

// calculate the distance between the center of the floor and the center of the wall
distance = width / 2
distance2 = length / 2
// calculate the displacement in x and z direction
dx = distance * cos
dz = distance * sin
dx2 = distance2 * sin
dz2 = distance2 * cos
// calculate the position of the wall
wallx = positionx 
wally = positiony + height / 2
wallz = positionz 

moveObject object1, positionx, positiony, positionz
rotateObject object1, rotationx, rotationy, rotationz
scaleObject object1, width, 0.001, length

moveObject object2, wallx - dx, wally, wallz + dz
rotateObject object2, rotationx, rotationy + 90, rotationz
scaleObject object2, length, height, thickness

moveObject object5, wallx - dx + thickness * 3, wally, wallz + dz
rotateObject object5, rotationx, rotationy + 90, rotationz
scaleObject object5, (height / 2) * (16/9) , height / 2, 0.001

moveObject object3, wallx + dx, wally, wallz - dz
rotateObject object3, rotationx, rotationy + 90, rotationz
scaleObject object3, length, height, thickness


moveObject object6, wallx + dx - thickness * 3 , wally, wallz - dz
rotateObject object6, rotationx, rotationy + 90, rotationz
scaleObject object6, (height / 2) * (16/9) , height / 2, 0.001

moveObject object4, wallx + dx2, wally, wallz + dz2
rotateObject object4, rotationx, rotationy, rotationz
scaleObject object4, width, height, thickness

moveObject object7, wallx + dx2, wally, wallz + dz2 - thickness * 3
rotateObject object7, rotationx, rotationy, rotationz
scaleObject object7, (height / 2) * (16/9) , height / 2, 0.001


/////////////

// Funktionen zur Objektmanipulation

// Funktion zum Anwenden der Transformationen auf ein Objekt
applyTransform = function(objectName, x, y, z, rx, ry, rz, width, height, length)
  moveObject objectName, x, y, z
  rotateObject objectName, rx, ry, rz
  scaleObject objectName, width, height, length
end function

// Funktion zur Berechnung der Wandposition
calcWallPosition = function(baseX, baseZ, distance, angle, offset)
  dx = distance * cos(angle)
  dz = distance * sin(angle)
  return [
    baseX + offset * dx,
    baseZ + offset * dz
  ]
end function

// Initialisierung

// Konstanten
length = 6
width = 12
height = 4
thickness = 0.1
baseheight = 0.15
basedepth = 0.2
positionx = 2
positiony = 0
positionz = 6
rotationx = 0
rotationy = 20
rotationz = 0

// Hilfsberechnungen
angle = rotationy * pi / 180
cos = cos(angle)
sin = sin(angle)

// Objektkonfigurationen
objectConfigs = [
  {name: "Floor1",   type: "Base", distanceOffset: 0,  rotationOffset: 0,  width: width, length: length, height: 0.001},
  {name: "Wall1a",   type: "Wall", distanceOffset: -1, rotationOffset: 90,  length: length, height: height, thickness: thickness},
  {name: "Image1",  type: "Image", distanceOffset: -1, rotationOffset: 90,  height: height},
  {name: "Wall1b",   type: "Wall", distanceOffset: 1,  rotationOffset: 90,  length: length, height: height, thickness: thickness},
  {name: "Image2",  type: "Image", distanceOffset: 1,  rotationOffset: 90,  height: height},
  {name: "Wall1c",   type: "Wall", distanceOffset: 0,  rotationOffset: 0,  width: width,  height: height, thickness: thickness},
  {name: "Image3",  type: "Image", distanceOffset: 1,  rotationOffset: 0,  height: height}
]

// Transformationen anwenden
for config in objectConfigs
  local x, z

  if config.type == "Wall" or config.type == "Image" then
    local wallPos = calcWallPosition(positionx, positionz, width / 2, angle, config.distanceOffset)
    x = wallPos[0]
    z = wallPos[1]
  else
    x = positionx
    z = positionz
  end if

  local w = config.width  ? config.width  : (config.type == "Image" ? (config.height / 2) * (16/9) : 1)
  local h = config.height ? config.height : 1
  local l = config.length ? config.length : 1
  local rOffset = config.rotationOffset ? config.rotationOffset : 0

  applyTransform(config.name, x, positiony, z, rotationx, rotationy + rOffset, rotationz, w, h, l)
end for
