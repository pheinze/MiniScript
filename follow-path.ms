numCubes = 100
cubeBaseName = "Cube"
cubeScale = 0.25 // Uniform scaling for all cubes

// Path parameters (for the leader)
pathScaleX = 5         // X-scale of the figure-eight path
pathScaleZ = 3         // Z-scale of the figure-eight path
pathSpeed = 0.5        // Speed of the leader along the path (radians per second)
pathYOffset = 2        // Base Y-position of the path
pathYAmplitude = 1.0   // Amplitude of Y-variation for the path

// Follower parameters
followerDelayFactor = 0.21 // How much delay each follower has relative to the previous one
                          // (Higher value means more spread out)

cubeNames = []
for i in range(1, numCubes)
    cubeNames.push(cubeBaseName + i)
end for

// Store the history of leader positions to calculate follower positions
positionHistory = []
historyLength = 200 // Max number of past positions to store (adjust based on path speed and delay)

// Calculate the maximum total delay for the last follower
maxTotalDelay = (numCubes - 1) ...ubeNames[0], leaderPosX, leaderPosY, leaderPosZ

    // Move follower cubes
    for i in range(1, numCubes - 1) // Start from Cube2 (index 1)
        currentCubeName = cubeNames[i]

        // Calculate the required delay for this follower in seconds
        requiredDelay = i * followerDelayFactor

        // Calculate the approximate number of steps back in history for this delay.
        historyStepsBack = floor(requiredDelay * (historyLength / maxTotalDelay))
        
        // Calculate the actual index in the positionHistory list
        historyIndex = positionHistory.len - 1 - historyStepsBack
        
        // Ensure index is valid (within bounds of positionHistory)
        if historyIndex < 0 then historyIndex = 0
        if historyIndex >= positionHistory.len then historyIndex = positionHistory.len - 1

        followerPos = positionHistory[historyIndex]

        moveObject currentCubeName, followerPos[0], followerPos[1], followerPos[2]
    end for

    //yield
end while
