object1 = "Floor1"
object2 = "Wall1a"
object3 = "Wall1b"
object4 = "Wall1c"
object5 = "Image1"
object6 = "Image2"
object7 = "Image3"

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

// Konstanten definieren
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

// Winkel in Radiant umrechnen und Cosinus/Sinus vorab berechnen
angle = rotationy * pi / 180
cos_angle = cos(angle)
sin_angle = sin(angle)

// Distanzen vorab berechnen
distance = width / 2
distance2 = length / 2

// Funktion zur Berechnung der Wandpositionen
calcWallPosition = function(x, z, dist, cos_a, sin_a, offset)
  return [
    x + offset * dist * cos_a,
    z + offset * dist * sin_a
  ]
end function

// Objektparameter in einer Datenstruktur speichern
objects = [
  { name: "Floor1",   type: "floor",   xOffset: 0,   zOffset: 0,   rotOffset: 0,   width: width,   height: 0.001, length: length },
  { name: "Wall1a",   type: "wall",    xOffset: -1,  zOffset: 1,   rotOffset: 90,  width: length,  height: height,  length: thickness },
  { name: "Image1",  type: "image",   xOffset: -1,  zOffset: 1,   rotOffset: 90,  width: null,    height: height,  length: 0.001 },
  { name: "Wall1b",   type: "wall",    xOffset: 1,   zOffset: -1,  rotOffset: 90,  width: length,  height: height,  length: thickness },
  { name: "Image2",  type: "image",   xOffset: 1,   zOffset: -1,  rotOffset: 90,  width: null,    height: height,  length: 0.001 },
  { name: "Wall1c",   type: "wall",    xOffset: 1,   zOffset: 1,   rotOffset: 0,   width: width,   height: height,  length: thickness },
  { name: "Image3",  type: "image",   xOffset: 1,   zOffset: 1,   rotOffset: 0,   width: null,    height: height,  length: 0.001 }
]

// Objekte verarbeiten
for obj in objects
  local x, z

  if obj.type == "floor" then
    x = positionx
    z = positionz
  elseif obj.type == "wall" then
    pos = calcWallPosition(positionx, positionz, distance, cos_angle, sin_angle, obj.xOffset)
    x = pos[0]
    z = pos[1]
  elseif obj.type == "image" then
    pos = calcWallPosition(positionx, positionz, distance, cos_angle, sin_angle, obj.xOffset)
    x = pos[0] + obj.length * 3   // Korrektur für Bildposition
    z = pos[1]
  end if

  local objWidth  = obj.width  ? obj.width  : (obj.type == "image" ? (obj.height / 2) * (16/9) : 1)
  local objLength = obj.length ? obj.length : 1

  moveObject   obj.name, x, positiony + (obj.type == "wall" ? height / 2 : 0), z
  rotateObject obj.name, rotationx, rotationy + obj.rotOffset, rotationz
  scaleObject  obj.name, objWidth, obj.height, objLength
end for


// 

// Tischparameter
tableWidth = 120   // Breite des Tisches
tableLength = 80  // Länge des Tisches
tableHeight = 0.8    // Höhe des Tisches

// Objektnamen
tableTopName = "Cube.TableTop"  // Name des Tischplatten-Objekts
tableLegName = "Cube.TableLeg"    // Name des Tischbein-Objekts

// Tischplatte skalieren und positionieren
moveObject tableTopName, 0, tableHeight, 0
scaleObject tableTopName, tableWidth, 0.1, tableLength

// Tischbeinparameter
tableLegWidth = 5       // Breite der Tischbeine
tableLegHeight = tableHeight // Höhe der Tischbeine
tableLegDepth = 5       // Tiefe der Tischbeine

// Funktion zum Positionieren und Skalieren eines Tischbeins
positionTableLeg = function(xOffset, zOffset)
    moveObject tableLegName, xOffset, tableLegHeight / 2, zOffset
    scaleObject tableLegName, tableLegWidth, tableLegHeight, tableLegDepth
end function

// Tischbeine positionieren und skalieren
positionTableLeg tableWidth / 2 - tableLegWidth / 2, tableLength / 2 - tableLegDepth / 2
positionTableLeg tableWidth / 2 - tableLegWidth / 2, -tableLength / 2 + tableLegDepth / 2
positionTableLeg -tableWidth / 2 + tableLegWidth / 2, tableLength / 2 - tableLegDepth / 2
positionTableLeg -tableWidth / 2 + tableLegWidth / 2, -tableLength / 2 + tableLegDepth / 2
