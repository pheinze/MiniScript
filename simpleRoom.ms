// Creates a simple room with walls, floor, and a detailed entrance area,
// allowing for configurable dimensions and rotation.
// The script defines objects, calculates their positions and orientations based on
// parameters, and then places them in the scene.

// --- Configuration ---
// Dimensions
length = 6
width = 12
height = 4
thickness = 0.1

// Positions
positionx = 2
positiony = 0
positionz = 6

// Rotations
rotationx = 0
rotationy = 45  // Example rotation (adjustable)
rotationz = 0

// --- Object Definitions ---

// Objects
floor_obj_name = "RoomFloor"
wall_main_left_obj_name = "RoomWallMainLeft"
wall_main_right_obj_name = "RoomWallMainRight"
wall_rear_obj_name = "RoomWallRear"
entrance_top_obj_name = "EntranceTopArch"
entrance_left_pillar_obj_name = "EntranceLeftPillar"
entrance_right_pillar_obj_name = "EntranceRightPillar"
entrance_edge_left_obj_name = "EntranceEdgeLeft"
entrance_edge_right_obj_name = "EntranceEdgeRight"
cylinder_1_obj_name = "EntranceCylinder1" // Was Edge1, now a distinct cylinder
cylinder_2_obj_name = "EntranceCylinder2" // Was Edge2, now a distinct cylinder
cylinder_3_obj_name = "EntranceCylinder3" // Was Edge3
cylinder_4_obj_name = "EntranceCylinder4" // Was Edge4

// --- Angle Calculation ---

// Angle in Radians
DEG_TO_RAD = pi / 180
angle_y_rad = rotationy * DEG_TO_RAD

// Sine and Cosine
cos_rotation_y = cos(angle_y_rad)
sin_rotation_y = sin(angle_y_rad)

// --- Distance Calculations ---

// Distances
half_width = width / 2
half_length = length / 2
half_height = height / 2

// --- Helper Functions ---

// Calculate X displacement based on distance and angle
calc_dx = function(dist, angle_cos)
  return dist * angle_cos
end function

// Calculate Z displacement based on distance and angle
calc_dz = function(dist, angle_sin)
  return dist * angle_sin
end function

// Object placement and scaling
place_object = function(obj, x, y, z, rotx, roty, rotz, scalex, scaley, scalez)
  moveObject obj, x, y, z
  rotateObject obj, rotx, roty, rotz
  scaleObject obj, scalex, scaley, scalez
end function

// --- Wall Positions Calculation ---
// dx, dz: Displacements for main side walls (originally parallel to Z-axis before rotation).
// These are based on half_width because the rotation pivot is at the center of the room.
// After Y-rotation, dx is the displacement along the world X-axis, and dz is along the world Z-axis.
dx = calc_dx(half_width, cos_rotation_y)
dz = calc_dz(half_width, sin_rotation_y)

// dx2, dz2: Displacements for the rear wall (originally parallel to X-axis before rotation).
// These are based on half_length.
// After Y-rotation, dx2 is the displacement along the world X-axis, and dz2 is along the world Z-axis.
// Note the use of sin_rotation_y for dx2 and cos_rotation_y for dz2 due to the wall's initial orientation.
dx2 = calc_dx(half_length, sin_rotation_y)
dz2 = calc_dz(half_length, cos_rotation_y)

wallx = positionx
wally = positiony + half_height
wallz = positionz

// --- Place Objects ---
// Floor
place_object(floor_obj_name, positionx, positiony, positionz, rotationx, rotationy, rotationz, width, 0.001, length)

// Walls
place_object(wall_main_left_obj_name, wallx - dx, wally, wallz + dz, rotationx, rotationy + 90, rotationz, length, height, thickness)
place_object(wall_main_right_obj_name, wallx + dx, wally, wallz - dz, rotationx, rotationy + 90, rotationz, length, height, thickness)
place_object(wall_rear_obj_name, wallx + dx2, wally, wallz + dz2, rotationx, rotationy, rotationz, width, height, thickness)

// Entrance Walls
// Entrance proportions appear to use values related to the golden ratio (e.g., 0.382, 0.618).
entrance_side_width = width * 0.382 / 2
entrance_top_width = width * 0.618
entrance_top_part_height_ratio = 0.382 / 2 // Renamed from entrance_top_start_height_percentage
entrance_top_height = height * entrance_top_part_height_ratio // Used renamed variable
// entrance_top_start_height is removed as it's redundant with entrance_top_height for object5 y-pos calculation
entrance_side_offset = (entrance_top_width / 2) + (entrance_side_width / 2)

// Pre-calculate displacements for entrance_side_offset
dx_entrance_side_offset = calc_dx(entrance_side_offset, cos_rotation_y)
dz_entrance_side_offset = calc_dz(entrance_side_offset, sin_rotation_y)

place_object(entrance_top_obj_name, wallx - dx2, positiony + height - entrance_top_height / 2, wallz - dz2, rotationx, rotationy, rotationz, entrance_top_width, entrance_top_height, thickness)
place_object(entrance_left_pillar_obj_name, wallx - dx2 - dx_entrance_side_offset, positiony + half_height, wallz - dz2 + dz_entrance_side_offset, rotationx, rotationy, rotationz, entrance_side_width, height, thickness)
place_object(entrance_right_pillar_obj_name, wallx - dx2 + dx_entrance_side_offset, positiony + half_height, wallz - dz2 - dz_entrance_side_offset, rotationx, rotationy, rotationz, entrance_side_width, height, thickness)
place_object(entrance_edge_left_obj_name, wallx - dx2 - dx_entrance_side_offset, positiony + half_height, wallz - dz2 + dz_entrance_side_offset, rotationx, rotationy, rotationz, thickness, half_height, thickness)
place_object(entrance_edge_right_obj_name, wallx - dx2 + dx_entrance_side_offset, positiony + half_height, wallz - dz2 - dz_entrance_side_offset, rotationx, rotationy, rotationz, thickness, half_height, thickness)

// Cylinders (Rounds at the Entrance)
// Pre-calculate offsets for cylinder placements
cylinder_center_lateral_offset_val = entrance_side_offset + entrance_side_width / 2
dx_cylinder_offset = calc_dx(cylinder_center_lateral_offset_val, cos_rotation_y)
dz_cylinder_offset = calc_dz(cylinder_center_lateral_offset_val, sin_rotation_y)

place_object(cylinder_1_obj_name, wallx - dx2 - dx_cylinder_offset, positiony + half_height, wallz - dz2 + dz_cylinder_offset, rotationx, rotationy, rotationz, thickness, half_height, thickness)
place_object(cylinder_2_obj_name, wallx - dx2 + dx_cylinder_offset, positiony + half_height, wallz - dz2 - dz_cylinder_offset, rotationx, rotationy, rotationz, thickness, half_height, thickness)
place_object(cylinder_3_obj_name, wallx + dx2 - dx_cylinder_offset, positiony + half_height, wallz + dz2 + dz_cylinder_offset, rotationx, rotationy, rotationz, thickness, half_height, thickness)
place_object(cylinder_4_obj_name, wallx + dx2 + dx_cylinder_offset, positiony + half_height, wallz + dz2 - dz_cylinder_offset, rotationx, rotationy, rotationz, thickness, half_height, thickness)
