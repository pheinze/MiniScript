setLightObject "Light1", "#FFD700", 0.4, "soft", 0.6

sunX = 0
sunY = 100
sunZ = 0

startTime = 12
endTime = 18
timeStep = 0.04

angleStep = 1200 / ((endTime - startTime) / timeStep)

for i in range(startTime, endTime, timeStep)
    angle = (i - startTime) * angleStep
    xAngle = 90 - angle
    yAngle = -angle

    rotateObject "Light1", xAngle, yAngle, 0

    wait 0.1
end for
