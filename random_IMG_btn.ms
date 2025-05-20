url = {0:"https://metaverse.my-domain.com/my-content/raum1/screen1/1.jpg",
1:"https://metaverse.my-domain.com/my-content/raum1/screen1/2.jpg",
2:"https://metaverse.my-domain.com/my-content/raum1/screen1/3.jpg",
3:"https://metaverse.my-domain.com/my-content/raum1/screen1/4.jpg",
4:"https://metaverse.my-domain.com/my-content/raum1/screen1/5.jpg",
5:"https://metaverse.my-domain.com/my-content/raum1/screen1/6.jpg",
6:"https://metaverse.my-domain.com/my-content/raum1/screen1/7.jpg",
7:"https://metaverse.my-domain.com/my-content/raum1/screen1/8.jpg",
8:"https://metaverse.my-domain.com/my-content/slides/Screenshot1.jpg",
9:"https://metaverse.my-domain.com/my-content/slides/Screenshot2.jpg",
10:"https://metaverse.my-domain.com/my-content/slides/Screenshot3.jpg",
11:"https://metaverse.my-domain.com/my-content/slides/Screenshot4.jpg",
12:"https://metaverse.my-domain.com/my-content/slides/Screenshot5.jpg",
13:"https://metaverse.my-domain.com/my-content/slides/Screenshot6.jpg",
14:"https://metaverse.my-domain.com/my-content/slides/Screenshot7.jpg"}

r = round(rnd*14)
networkCommand "Screen1", "changeTexture", url[r]