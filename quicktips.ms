// Define dictionaries with hexadecimal values
r = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
s = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
t = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
u = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
v = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}
w = {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, 10:"A", 11:"B", 12:"C", 13:"D", 14:"E", 15:"F"}

// Generate random values for color generation
z = round(rnd+20)
k = round(rnd*15)
l = round(rnd*15)
m = round(rnd*15)
n = round(rnd*15)
o = round(rnd*15)
p = round(rnd*15)

// Combine hexadecimal values to form a color code
color = "#" + r[k] + s[l] + t[m] + u[n] + v[o] + w[p]


message = {1:"This message box dissapears when you click the mouse somewhere.
Type that command in the backend and use the messageBox on your space.

<b>=> messageBox, sTitle, sMessage</b>",
2:"There are currently 4 networkCommands and will increase over time.

Example: moveObject, scaleObject, rotateObject and changeTexture",
3:"You can clone your plot.

Add the plot clone object.
In the obj props, type in the total number of users before a new clone is made. ",
4:"Add in any object or GLB file you want to act as your NPC and give it a NAME - Create as many trigger items as you would like.",
5:"You can setup a plot password.

Go into the Backend and choose the PlotPassword Object then type in a password with no spaces.",
6:"You can set and play AMBIENT Audio with any object.

(The centre will become the loudest area if you have 3D sounds enabled.) ",
7:"Add Slide Shows and Presentations to your plot of land.

Use the keyboard HOT KEYS J, K and L where J = Back, K = Play/Pause and L = Forward",
8:"You can play audio and video.

Type:
playAudio sMP3URL, sLooping, fVolume
playVideo sObjectName, sMP4URL, sLooping, fVolume

sMP3URL or sMP4URL = https URL to any mp3 or mp4 file
sLooping = “loop” or “false”
fVolume is a value from 0.0 to 1.0 where 1.0 = 100% volume

— We recommend you use a cube for videos,",
9:"Scale a magic field to 100, 1, 100 and you get a nice background effect.",
10:"YOu can start your avatar at ANY location in a plot?

At the end of a URL put the following command &posdata=fX,fY,fZ,fYRot
Example: https://metaverse.meetaspace/index.php?plot_id=BoringLand&posdata=20.0,4,2,-32,20.0
",
11:"Make a localJump to any object.

Select the => On_Click Interaction and type the command
localJump sObjectName",
12:"You can use some Rich text formats everywhere.
b, i, size and color
<i>Note: The backend editor immediately interprets RTF</i>"}


r2 = round(rnd * message.len - 1) + 1
randomcolor = "<color=" + color + ">"
title = randomcolor + "Quicktip Nr°" + r2 + "</color>"

for i in range(0, message[r2].len / 2)
t = rnd / 10
messageBox title, message[r2][:i*2]
yield
end for