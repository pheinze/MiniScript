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
// These define the overall rotation of the entire room in degrees.
room_rotation_x = 0
room_rotation_y = 45  // Example rotation (adjustable)
room_rotation_z = 0

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

// --- Distance Calculations ---
// Note: half_width, half_length, half_height are kept for defining object dimensions
// relative to the room's overall size. Their role in positioning will change
// with the new 3D rotation logic.
half_width = width / 2
half_length = length / 2
half_height = height / 2

// --- Helper Functions ---

// Rotates a 3D point specified as an array [x, y, z] around the origin
// using the provided rotation angles (in degrees for X, Y, Z axes).
// Returns the new point coordinates as an array.
rotate_point_3d = function(point_to_rotate_arr room_rot_x_deg room_rot_y_deg room_rot_z_deg)
(
  // Convert array to Point3
  p3 = point3 point_to_rotate_arr[1] point_to_rotate_arr[2] point_to_rotate_arr[3]
  
  // Create rotation matrix (default ZYX order for eulerAngles)
  rotation_matrix = (eulerAngles room_rot_x_deg room_rot_y_deg room_rot_z_deg) as matrix3
  
  // Apply rotation
  rotated_p3 = p3 * rotation_matrix
  
  // Convert Point3 back to array
  rotated_arr = [rotated_p3.x, rotated_p3.y, rotated_p3.z]
  
  return rotated_arr
)

// Object placement, orientation, and scaling
place_object = function(obj_name world_pos_arr world_orientation_quat scale_arr)
(
  obj = getNodeByName obj_name
  if obj == undefined do (
    -- This is a placeholder for actual geometry creation.
    -- For now, we print a warning, assuming objects are pre-defined in the scene
    -- or will be created by a different mechanism if this script is for layout only.
    format "Warning: Object '%' not found. Skipping placement.
" obj_name
    return false // Indicate failure or skip
  )
  
  obj.position = point3 world_pos_arr[1] world_pos_arr[2] world_pos_arr[3]
  obj.rotation = world_orientation_quat 
  
  -- MaxScript's default scale is [1,1,1]. If scale_arr contains 0s, it might make object invisible or cause issues.
  -- Consider adding checks for valid scale values if necessary.
  -- Scaling is applied in object's local coordinates.
  -- To set scale absolutely, it's tricky if the object has a non-identity transform from a parent.
  -- For unparented objects, obj.scale = [sx,sy,sz] works.
  -- Let's assume direct .scale application is fine for this context.
  obj.scale.x = scale_arr[1]
  obj.scale.y = scale_arr[2]
  obj.scale.z = scale_arr[3]
  
  return true // Indicate success
)
// End of place_object function

// --- Overall 3D Rotation and Placement Strategy ---
// For each object in the room:
// 1. Define Local Position: The object's pivot point is defined as a local vector
//    (e.g., `obj_local_pos_arr`) relative to the room's conceptual origin (0,0,0).
//    This conceptual origin is then shifted in world space by `positionx, positiony, positionz`.
// 2. Define Local Intrinsic Rotation: The object's own rotation (e.g., a wall turned 90 degrees)
//    is defined as local Euler angles (e.g., `obj_local_rot_deg_arr`).
// 3. Calculate World Position:
//    a. The local position vector is rotated by the room's global rotation angles
//       (`room_rotation_x`, `room_rotation_y`, `room_rotation_z`) using the `rotate_point_3d` function.
//    b. This rotated vector is then added to the room's main pivot point (`positionx`, `positiony`, `positionz`)
//       to get the object's final world coordinates.
// 4. Calculate World Orientation:
//    a. The room's global rotation is converted to a matrix (`T_room`).
//    b. The object's local intrinsic rotation is converted to a matrix (`T_local_object`).
//    c. These are combined: `T_world_object = T_local_object * T_room`. This means the object's
//       local coordinate system (defined by `T_local_object`) is itself rotated by `T_room`.
//    d. The resulting world matrix is converted to a quaternion for the `place_object` function.
// 5. Place Object: The `place_object` function is called with the calculated world position,
//    world orientation quaternion, and a scale array.

// --- Place Objects ---

// Floor
// -- Local definition for the Floor (relative to room pivot [positionx, positiony, positionz])
floor_local_pos_arr = [0.0, 0.0, 0.0] // Floor is at the room's pivot point
floor_local_rot_deg_arr = [0.0, 0.0, 0.0] // No local intrinsic rotation for the floor

// -- Calculate Floor's World Position
// Rotate the floor's local position by the room's global rotation
floor_rotated_local_pos_arr = rotate_point_3d floor_local_pos_arr room_rotation_x room_rotation_y room_rotation_z
// Add the room's pivot to get the floor's final world position
floor_world_pos_arr = [ \
  (positionx + floor_rotated_local_pos_arr[1]), \
  (positiony + floor_rotated_local_pos_arr[2]), \
  (positionz + floor_rotated_local_pos_arr[3]) \
]

// -- Calculate Floor's World Orientation
// This global room rotation matrix will be used for all objects.
T_room = (eulerAngles room_rotation_x room_rotation_y room_rotation_z) as matrix3
// Floor's local intrinsic rotation matrix
T_floor_local = (eulerAngles floor_local_rot_deg_arr[1] floor_local_rot_deg_arr[2] floor_local_rot_deg_arr[3]) as matrix3
// Combined world rotation matrix for the floor
T_floor_world = T_floor_local * T_room
// Convert to quaternion for object orientation
floor_world_orientation_quat = T_floor_world as quat

// -- Define Floor's Scale
// Using 'thickness' for the floor's height for consistency with walls.
// The original script used 0.001 for the floor's Z scale (height). If that specific
// small height is crucial and different from wall 'thickness', this should be adjusted.
floor_scale_arr = [width, thickness, length] -- width (X), thickness (Y), length (Z) in local coords

// -- Place the Floor Object
place_object floor_obj_name floor_world_pos_arr floor_world_orientation_quat floor_scale_arr

// Walls
// Using T_room defined in the Floor section.

// -- Wall Main Left (wall_main_left_obj_name) --
// Local definition (relative to room pivot [positionx, positiony, positionz])
wml_local_pos_arr = [-half_width, half_height, 0.0]
wml_local_rot_deg_arr = [0.0, 90.0, 0.0] // Rotated 90 deg on Y to face inwards if room is along Z

// Calculate World Position
wml_rotated_local_pos_arr = rotate_point_3d wml_local_pos_arr room_rotation_x room_rotation_y room_rotation_z
wml_world_pos_arr = [ \
  (positionx + wml_rotated_local_pos_arr[1]), \
  (positiony + wml_rotated_local_pos_arr[2]), \
  (positionz + wml_rotated_local_pos_arr[3]) \
]

// Calculate World Orientation
T_wml_local = (eulerAngles wml_local_rot_deg_arr[1] wml_local_rot_deg_arr[2] wml_local_rot_deg_arr[3]) as matrix3
T_wml_world = T_wml_local * T_room // T_room must be in scope from Floor calculation
wml_world_orientation_quat = T_wml_world as quat

// Define Scale
wml_scale_arr = [length, height, thickness] // length (X), height (Y), thickness (Z) in local coords

// Place the Wall Main Left
place_object wall_main_left_obj_name wml_world_pos_arr wml_world_orientation_quat wml_scale_arr

// -- Wall Main Right (wall_main_right_obj_name) --
// Local definition
wmr_local_pos_arr = [half_width, half_height, 0.0]
wmr_local_rot_deg_arr = [0.0, -90.0, 0.0] // Rotated -90 deg on Y to face inwards

// Calculate World Position
wmr_rotated_local_pos_arr = rotate_point_3d wmr_local_pos_arr room_rotation_x room_rotation_y room_rotation_z
wmr_world_pos_arr = [ \
  (positionx + wmr_rotated_local_pos_arr[1]), \
  (positiony + wmr_rotated_local_pos_arr[2]), \
  (positionz + wmr_rotated_local_pos_arr[3]) \
]

// Calculate World Orientation
T_wmr_local = (eulerAngles wmr_local_rot_deg_arr[1] wmr_local_rot_deg_arr[2] wmr_local_rot_deg_arr[3]) as matrix3
T_wmr_world = T_wmr_local * T_room
wmr_world_orientation_quat = T_wmr_world as quat

// Define Scale
wmr_scale_arr = [length, height, thickness]

// Place the Wall Main Right
place_object wall_main_right_obj_name wmr_world_pos_arr wmr_world_orientation_quat wmr_scale_arr

// -- Wall Rear (wall_rear_obj_name) --
// Local definition
wr_local_pos_arr = [0.0, half_height, -half_length] // At the back of the room
wr_local_rot_deg_arr = [0.0, 0.0, 0.0] // No local rotation, faces along its local Z towards +Z

// Calculate World Position
wr_rotated_local_pos_arr = rotate_point_3d wr_local_pos_arr room_rotation_x room_rotation_y room_rotation_z
wr_world_pos_arr = [ \
  (positionx + wr_rotated_local_pos_arr[1]), \
  (positiony + wr_rotated_local_pos_arr[2]), \
  (positionz + wr_rotated_local_pos_arr[3]) \
]

// Calculate World Orientation
T_wr_local = (eulerAngles wr_local_rot_deg_arr[1] wr_local_rot_deg_arr[2] wr_local_rot_deg_arr[3]) as matrix3
T_wr_world = T_wr_local * T_room
wr_world_orientation_quat = T_wr_world as quat

// Define Scale
wr_scale_arr = [width, height, thickness] // width (X), height (Y), thickness (Z) in local coords

// Place the Wall Rear
place_object wall_rear_obj_name wr_world_pos_arr wr_world_orientation_quat wr_scale_arr

// Entrance Walls
// Using T_room defined in the Floor section.
// Entrance plane Z-coordinate in room's local unrotated space:
entrance_local_z = half_length

// Entrance static dimensions (relative to room's width/height)
// These values are based on the overall room dimensions.
entrance_side_width = width * 0.382 / 2
entrance_top_width = width * 0.618
entrance_top_part_height_ratio = 0.382 / 2 
entrance_top_height = height * entrance_top_part_height_ratio
entrance_side_offset = (entrance_top_width / 2) + (entrance_side_width / 2) // Offset from center to the middle of side pillars/edges

// -- Entrance Top Arch (entrance_top_obj_name) --
// Local definition (relative to room pivot [positionx, positiony, positionz])
eta_local_pos_arr = [0.0, height - (entrance_top_height / 2.0), entrance_local_z]
eta_local_rot_deg_arr = [0.0, 0.0, 0.0]

// Calculate World Position
eta_rotated_local_pos_arr = rotate_point_3d eta_local_pos_arr room_rotation_x room_rotation_y room_rotation_z
eta_world_pos_arr = [ \
  (positionx + eta_rotated_local_pos_arr[1]), \
  (positiony + eta_rotated_local_pos_arr[2]), \
  (positionz + eta_rotated_local_pos_arr[3]) \
]

// Calculate World Orientation
T_eta_local = (eulerAngles eta_local_rot_deg_arr[1] eta_local_rot_deg_arr[2] eta_local_rot_deg_arr[3]) as matrix3
T_eta_world = T_eta_local * T_room
eta_world_orientation_quat = T_eta_world as quat

// Define Scale
eta_scale_arr = [entrance_top_width, entrance_top_height, thickness]

// Place the Entrance Top Arch
place_object entrance_top_obj_name eta_world_pos_arr eta_world_orientation_quat eta_scale_arr

// -- Entrance Left Pillar (entrance_left_pillar_obj_name) --
// Local definition
elp_local_pos_arr = [-entrance_side_offset, half_height, entrance_local_z]
elp_local_rot_deg_arr = [0.0, 0.0, 0.0]

// Calculate World Position
elp_rotated_local_pos_arr = rotate_point_3d elp_local_pos_arr room_rotation_x room_rotation_y room_rotation_z
elp_world_pos_arr = [ \
  (positionx + elp_rotated_local_pos_arr[1]), \
  (positiony + elp_rotated_local_pos_arr[2]), \
  (positionz + elp_rotated_local_pos_arr[3]) \
]

// Calculate World Orientation
T_elp_local = (eulerAngles elp_local_rot_deg_arr[1] elp_local_rot_deg_arr[2] elp_local_rot_deg_arr[3]) as matrix3
T_elp_world = T_elp_local * T_room
elp_world_orientation_quat = T_elp_world as quat

// Define Scale
elp_scale_arr = [entrance_side_width, height, thickness]

// Place the Entrance Left Pillar
place_object entrance_left_pillar_obj_name elp_world_pos_arr elp_world_orientation_quat elp_scale_arr

// -- Entrance Right Pillar (entrance_right_pillar_obj_name) --
// Local definition
erp_local_pos_arr = [entrance_side_offset, half_height, entrance_local_z]
erp_local_rot_deg_arr = [0.0, 0.0, 0.0]

// Calculate World Position
erp_rotated_local_pos_arr = rotate_point_3d erp_local_pos_arr room_rotation_x room_rotation_y room_rotation_z
erp_world_pos_arr = [ \
  (positionx + erp_rotated_local_pos_arr[1]), \
  (positiony + erp_rotated_local_pos_arr[2]), \
  (positionz + erp_rotated_local_pos_arr[3]) \
]

// Calculate World Orientation
T_erp_local = (eulerAngles erp_local_rot_deg_arr[1] erp_local_rot_deg_arr[2] erp_local_rot_deg_arr[3]) as matrix3
T_erp_world = T_erp_local * T_room
erp_world_orientation_quat = T_erp_world as quat

// Define Scale
erp_scale_arr = [entrance_side_width, height, thickness]

// Place the Entrance Right Pillar
place_object entrance_right_pillar_obj_name erp_world_pos_arr erp_world_orientation_quat erp_scale_arr

// -- Entrance Edge Left (entrance_edge_left_obj_name) --
// Local definition
eel_local_pos_arr = [-entrance_side_offset, half_height / 2.0, entrance_local_z]
eel_local_rot_deg_arr = [0.0, 0.0, 0.0]

// Calculate World Position
eel_rotated_local_pos_arr = rotate_point_3d eel_local_pos_arr room_rotation_x room_rotation_y room_rotation_z
eel_world_pos_arr = [ \
  (positionx + eel_rotated_local_pos_arr[1]), \
  (positiony + eel_rotated_local_pos_arr[2]), \
  (positionz + eel_rotated_local_pos_arr[3]) \
]

// Calculate World Orientation
T_eel_local = (eulerAngles eel_local_rot_deg_arr[1] eel_local_rot_deg_arr[2] eel_local_rot_deg_arr[3]) as matrix3
T_eel_world = T_eel_local * T_room
eel_world_orientation_quat = T_eel_world as quat

// Define Scale
eel_scale_arr = [thickness, half_height, thickness]

// Place the Entrance Edge Left
place_object entrance_edge_left_obj_name eel_world_pos_arr eel_world_orientation_quat eel_scale_arr

// -- Entrance Edge Right (entrance_edge_right_obj_name) --
// Local definition
eer_local_pos_arr = [entrance_side_offset, half_height / 2.0, entrance_local_z]
eer_local_rot_deg_arr = [0.0, 0.0, 0.0]

// Calculate World Position
eer_rotated_local_pos_arr = rotate_point_3d eer_local_pos_arr room_rotation_x room_rotation_y room_rotation_z
eer_world_pos_arr = [ \
  (positionx + eer_rotated_local_pos_arr[1]), \
  (positiony + eer_rotated_local_pos_arr[2]), \
  (positionz + eer_rotated_local_pos_arr[3]) \
]

// Calculate World Orientation
T_eer_local = (eulerAngles eer_local_rot_deg_arr[1] eer_local_rot_deg_arr[2] eer_local_rot_deg_arr[3]) as matrix3
T_eer_world = T_eer_local * T_room
eer_world_orientation_quat = T_eer_world as quat

// Define Scale
eer_scale_arr = [thickness, half_height, thickness]

// Place the Entrance Edge Right
place_object entrance_edge_right_obj_name eer_world_pos_arr eer_world_orientation_quat eer_scale_arr

// Cylinders (Rounds at the Entrance)
// Using T_room defined in the Floor section.
// Z-coordinates for front (entrance) and rear placement in room's local unrotated space:
entrance_local_z = half_length  -- Already defined in Entrance Walls, re-stating for clarity or can be removed if certain it's always available
rear_local_z = -half_length

// Recalculate cylinder_center_lateral_offset_val (dependencies are in // Entrance Walls section)
// entrance_side_width = width * 0.382 / 2
// entrance_top_width = width * 0.618
// entrance_side_offset = (entrance_top_width / 2) + (entrance_side_width / 2)
cylinder_center_lateral_offset_val = entrance_side_offset + (entrance_side_width / 2.0)

// Common Y-position for cylinders (center of the object)
cylinder_local_y = half_height / 2.0

// Common Scale for cylinders
cyl_scale_arr = [thickness, half_height, thickness] // Assuming cylinders are standing upright, so Y is their height

// Common Local Intrinsic Rotation and World Orientation for cylinders
cyl_local_rot_deg_arr = [0.0, 0.0, 0.0]
T_cyl_local = (eulerAngles cyl_local_rot_deg_arr[1] cyl_local_rot_deg_arr[2] cyl_local_rot_deg_arr[3]) as matrix3
// Since T_cyl_local is identity, T_cyl_world is same as T_room
cyl_world_orientation_quat = T_room as quat // Use T_room directly

// -- Cylinder 1 (cylinder_1_obj_name) - Front Left --
// Local definition
cyl1_local_pos_arr = [-cylinder_center_lateral_offset_val, cylinder_local_y, entrance_local_z]

// Calculate World Position
cyl1_rotated_local_pos_arr = rotate_point_3d cyl1_local_pos_arr room_rotation_x room_rotation_y room_rotation_z
cyl1_world_pos_arr = [ \
  (positionx + cyl1_rotated_local_pos_arr[1]), \
  (positiony + cyl1_rotated_local_pos_arr[2]), \
  (positionz + cyl1_rotated_local_pos_arr[3]) \
]
// Place Cylinder 1
place_object cylinder_1_obj_name cyl1_world_pos_arr cyl_world_orientation_quat cyl_scale_arr

// -- Cylinder 2 (cylinder_2_obj_name) - Front Right --
// Local definition
cyl2_local_pos_arr = [cylinder_center_lateral_offset_val, cylinder_local_y, entrance_local_z]

// Calculate World Position
cyl2_rotated_local_pos_arr = rotate_point_3d cyl2_local_pos_arr room_rotation_x room_rotation_y room_rotation_z
cyl2_world_pos_arr = [ \
  (positionx + cyl2_rotated_local_pos_arr[1]), \
  (positiony + cyl2_rotated_local_pos_arr[2]), \
  (positionz + cyl2_rotated_local_pos_arr[3]) \
]
// Place Cylinder 2
place_object cylinder_2_obj_name cyl2_world_pos_arr cyl_world_orientation_quat cyl_scale_arr

// -- Cylinder 3 (cylinder_3_obj_name) - Rear Left --
// Local definition
cyl3_local_pos_arr = [-cylinder_center_lateral_offset_val, cylinder_local_y, rear_local_z]

// Calculate World Position
cyl3_rotated_local_pos_arr = rotate_point_3d cyl3_local_pos_arr room_rotation_x room_rotation_y room_rotation_z
cyl3_world_pos_arr = [ \
  (positionx + cyl3_rotated_local_pos_arr[1]), \
  (positiony + cyl3_rotated_local_pos_arr[2]), \
  (positionz + cyl3_rotated_local_pos_arr[3]) \
]
// Place Cylinder 3
place_object cylinder_3_obj_name cyl3_world_pos_arr cyl_world_orientation_quat cyl_scale_arr

// -- Cylinder 4 (cylinder_4_obj_name) - Rear Right --
// Local definition
cyl4_local_pos_arr = [cylinder_center_lateral_offset_val, cylinder_local_y, rear_local_z]

// Calculate World Position
cyl4_rotated_local_pos_arr = rotate_point_3d cyl4_local_pos_arr room_rotation_x room_rotation_y room_rotation_z
cyl4_world_pos_arr = [ \
  (positionx + cyl4_rotated_local_pos_arr[1]), \
  (positiony + cyl4_rotated_local_pos_arr[2]), \
  (positionz + cyl4_rotated_local_pos_arr[3]) \
]
// Place Cylinder 4
place_object cylinder_4_obj_name cyl4_world_pos_arr cyl_world_orientation_quat cyl_scale_arr
