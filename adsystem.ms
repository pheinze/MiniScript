url = {0:"https://metaverse.my-domain.com/my-content/championverse/Ads/Ad1.jpg",
1:"https://metaverse.my-domain.com/my-content/championverse/Ads/Ad2.jpg",
2:"https://metaverse.my-domain.com/my-content/championverse/Ads/Ad3.jpg",
3:"https://metaverse.my-domain.com/my-content/championverse/Ads/Ad4.jpg",
4:"https://metaverse.my-domain.com/my-content/championverse/Ads/Ad5.jpg",
5:"https://metaverse.my-domain.com/my-content/championverse/Ads/Ad6.jpg",
6:"https://metaverse.my-domain.com/my-content/championverse/Ads/Ad7.jpg",
7:"https://metaverse.my-domain.com/my-content/championverse/Ads/Ad8.jpg",
7:"https://metaverse.my-domain.com/my-content/championverse/Ads/Ad9.jpg",
8:"https://metaverse.my-domain.com/my-content/championverse/Ads/Ad10.jpg",
9:"https://metaverse.my-domain.com/my-content/championverse/Ads/Ad9.jpg",
10:"https://metaverse.my-domain.com/my-content/championverse/Ads/Ad8.jpg"}

while true
r = round(rnd*2)
t = round(rnd*20 + 60)
networkCommand "Ad1", "changeTexture", url[r]
wait t
end while

rndAnimation = {0:4,1:8,2:25,3:29,4:32,5:38,6:41,7:42,8:42,9:44,10:80,11:81,12:82,13:84,14:85,15:86,16:87,17:88,18:94,19:95,20:101}
customAvatarAnim "soccerAd1", rndAnimation[round(rnd*20)]