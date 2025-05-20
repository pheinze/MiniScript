// Dictionary to store the URLs of the advertisements
urls = {
    "url1": "https://metaverse.my-domain.com/my-content/ads/ad1.png",
    "url2": "https://metaverse.my-domain.com/my-content/ads/ad2.png",
    "url3": "https://metaverse.my-domain.com/my-content/ads/ad3.png",
    "url4": "https://metaverse.my-domain.com/my-content/ads/ad4.png",
    "url5": "https://metaverse.my-domain.com/my-content/ads/ad5.png",
    "url6": "https://metaverse.my-domain.com/my-content/ads/ad6.png",
    "url7": "https://metaverse.my-domain.com/my-content/ads/ad7.png",
    "url8": "https://metaverse.my-domain.com/my-content/ads/ad8.png",
    "url9": "https://metaverse.my-domain.com/my-content/ads/ad9.png",
    "url10": "https://metaverse.my-domain.com/my-content/ads/ad10.png",
    "url11": "https://metaverse.my-domain.com/my-content/ads/ad11.png",
    "url12": "https://metaverse.my-domain.com/my-content/ads/ad12.png",
    "url13": "https://metaverse.my-domain.com/my-content/ads/ad13.png",
    "url14": "https://metaverse.my-domain.com/my-content/ads/ad14.png",
    "url15": "https://metaverse.my-domain.com/my-content/ads/ad15.png",
    "url16": "https://metaverse.my-domain.com/my-content/ads/ad16.png"
}

// List to store the advertisement names
images = {
    "Ad1": [urls["url1"], urls["url2"], urls["url3"]],
    "Ad2": [urls["url4"], urls["url5"], urls["url6"]],
    "Ad3": [urls["url7"], urls["url8"], urls["url9"]],
    "Ad4": [urls["url10"], urls["url11"], urls["url12"]],
    "Ad5": [urls["url13"], urls["url14"], urls["url15"]],
    "Ad6": [urls["url16"], urls["url17"], urls["url18"]]
}

while true
// Loop through each advertisement name
    for ad in images.keys()
        imageIndex = rnd(images[ad].length())
        image = images[ad][imageIndex]
        networkCommand ad, "changeTexture", image
    end for

    wait rnd*10
end while

//////////
/////////////
url = {0:"https://metaverse.my-domain.com/my-content/ads/ad1.png",
1:"https://metaverse.my-domain.com/my-content/ads/ad2.png",
2:"https://metaverse.my-domain.com/my-content/ads/ad3.png"}

while true
r = round(rnd*2)
t = round(rnd*3)
networkCommand "Ad1", "changeTexture", url[r]
wait t*2
end while