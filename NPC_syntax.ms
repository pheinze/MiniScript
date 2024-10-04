m = {1: "Hau den Ball ins Tor, nicht den Müll daneben!", 2: "Sei kein Trottel, wirf den Müll in den Bottel!", 3: "Biomüll, Restmüll oder Bier? – Bei mir landet alles im richtigen Hier!", 4: "Volltreffer! Du hast den Mülleimer erwischt!",5: "Danke, dass du meinen Hunger stillst... äh, meine Aufgabe erfüllst!", 6: "Gemeinsam für eine saubere Welt, zeig dein Umwelt-Heldentum!", 7:"Mülltrennung leicht gemacht: Einfach alles in mich reingekracht!", 8: "Schmeiß deinen Müll nicht weg, wirf ihn in den Behälter!", 9: "Halte deine Umwelt sauber, sei kein Müll-Rabauke!", 10:"Mit ein bisschen Mühe, bleibt die Umwelt wie neu!", 11:"Die Natur ist unser Zuhause, lass uns sie nicht vermüllen!", 12:"Eine saubere Umwelt ist doch klar, schmeiß deinen Müll nicht einfach hin, sei solidar!"}

r= round(rnd*12) + 1
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