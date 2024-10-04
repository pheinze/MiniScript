message = {1:"My message 1.",
    2:"My long message 2.",
    3:" My very long message 3."}
 
r2 = round(rnd*message.len - 1) + 1 
title = "My Message Nr°" + r2

for i in range(0,message[r2].len / 1)
    messageBox title, message[r2][:i * 1]
    t = rnd / 10 *rnd*2
    wait t 
    // yield
end for

// This Script show's random messages and writes them with a typewriter effect.
// In the first part it generates a map where you can add as many messages as you want.
// r2 generates a random number between 1 and the amount of messages (items of the map (.len)).
// In line 8 and 9 you can modify the numbers (/1 and *1 !together) of the letters that will show with every new frame (messageBox).
// t makes a random time between 0 and 0.l seconds multiplied with a random number between 0 and 2