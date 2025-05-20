m = {1: "Message 1", 2: "Message 2", 3: "Message 4", 4: "Message 5",5: "Message 5", 6: "Message 6", 7:"Message 7", 8: "Message 8", 9: "Message 9", 10:"Message 10", 11:"Message 11", 12:"Message 12"}

r= round(rnd*m.len) + 1
object1 = "trash"
camY = 0.5
mtime = 4
role= ""
sr = "random"
sound = "6"
gpt = "false"
code = ""
ttp = "true"
makeNPC object1, camY, mtime, role, m[r], m[r], m[r], m[r], m[r], sr, sound, gpt, code, ttp
wait 4
rotateObject "trash", 0, 180, 0