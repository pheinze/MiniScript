
// Button 1
button = 1

handleButtonSelection = function(selectedButton)
    buttons = ["btn_video_on", "btn_video_off", "btn_voice_on", "btn_voice_off"]
    sx = 0.2
    sy = 0.2
    sz = 0.001

    // Positionsbestimmung nur am Anfang
    positions = {}
    positions["btn_video_on"] = -27.5
    positions["btn_video_off"] = -27.5
    positions["btn_voice_on"] = -27
    positions["btn_voice_off"] = -27
    y = 1.2
    z = -31.95

    for i in range(1, buttons.len)
        buttonName = buttons[i - 1]
        x_pos = positions[buttonName]  // Position aus der Map abrufen

        if selectedButton == 1 then
            moveObject "Videochat1", -35, 0.2, -25
            scaleObject "Videochat1", 10, 0.25, 10
            moveObject "Voicechat1", -24, 0.2, 6
            scaleObject "Voicechat1", 32, 0.25, 52

            if i == 1 or i == 4 then
                scaleObject buttonName, sx, sy, sz
            else
                scaleObject buttonName, sx/1.12, sy/1.12, sz/1.12
            end if
        else if selectedButton == 2 or selectedButton == 4 then
            if i == 2 or i == 4 then
                scaleObject buttonName, sx, sy, sz
            else
                scaleObject buttonName, sx/1.12, sy/1.12, sz/1.12
            end if
        else if selectedButton == 3 then
            if i == 2 or i == 3 then
                scaleObject buttonName, sx, sy, sz
            else
                scaleObject buttonName, sx/1.12, sy/1.12, sz/1.12
            end if
        end if
        moveObject buttonName, x_pos, y, z

    end for


end function

handleButtonSelection(button)


//Button 3
button = 3

handleButtonSelection = function(buttonNumber)
    buttons = ["btn_video_on", "btn_video_off", "btn_voice_on", "btn_voice_off"]
    selectedScale = "0.1, 0.1, 0.001"
    normalScale = "0.09, 0.09, 0.0009"
    positions = {
        1: "-2.5, 0.1251, 2.5",
        2: "-5.5, 0.1251, 5.5",
        3: "-8.5, 0.1251, 8.5",
        4: "-11.5, 0.1251, 11.5"
    }
    for i in range(1, buttons.len)
        buttonName = buttons[i - 1]
        if i == buttonNumber then
            networkCommand buttonName, "scaleObject", selectedScale
            networkCommand buttonName, "moveObject", positions[i]
        else
            networkCommand buttonName, "scaleObject", normalScale
            networkCommand buttonName, "moveObject", positions[i]
        end if
    end for
end function

handleButtonSelection(button)