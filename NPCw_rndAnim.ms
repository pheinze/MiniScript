a ={0:"2", 1:"9", 2:"6", 3:"3", 4:"10"}
b ={0:5, 1:6, 2:5, 3:3, 4:3}
r = round(rnd*4)
aniObject "dog", a[r], "oneshot", 1
//
m = {1: "Woof! Good day, adventurer! Ready for new discoveries?", 2: "Have you ever thought about how many balls could be hidden in this world?", 3: "Are you in search of a puzzle? I've got one for you: What has four legs in the morning, two legs at noon, and three legs in the evening?", 4: "I've heard of a magical lake that grants wishes. Perhaps we'll find it together!",5: "You're my favorite human companion. But could you conjure up a few more bones?"}

object1 = "dog"
camY = 0.5
mtime = 4
role= ""
sr = "random"
sound = "6"
gpt = "false"
code = ""
ttp = "true"
makeNPC object1, camY, mtime, role, m[1], m[2], m[3], m[4], m[5], sr, sound, gpt, code, ttp

wait b[r]
aniObject "dog", "1", "oneshot", 0.5
