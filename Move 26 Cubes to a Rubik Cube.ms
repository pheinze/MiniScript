cubeSize = 0.57
spacing = 0.1
sideSize = cubeSize * 3 + spacing * 2
centerX = 0
centerY = 0
centerZ = 0

for i in range(1, 27)
   
end for

index = 1
for x in range(-1, 1)
    for y in range(-1, 1)
        for z in range(-1, 1)
            if x == 0 and y == 0 and z == 0 then
                continue
            end if

            posX = centerX + x * (cubeSize + spacing)
            posY = centerY + y * (cubeSize + spacing)
            posZ = centerZ + z * (cubeSize + spacing)
            
            moveObject "Cube" + index, posX, posY, posZ
            scaleObject "Cube" + index, cubeSize, cubeSize, cubeSize
            wait 0.1
            index = index + 1
        end for
    end for
end for