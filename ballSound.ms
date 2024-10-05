r = round(rnd*9) + 1
url = "https://metaverse.web3done.com/my-content/sounds/ballkick/ballkick" + r + ".mp3"
playAudio "ballSound_trigger", url, "oneshot", 1

miniscript
// Generate a random number between 0 and 9
r = round(rnd*9)

// Construct the URL for the audio file with the random number appended
url = "https://metaverse.web3done.com/my-content/sounds/ballkick/ballkick" + r + ".mp3"

// Play the audio file with the specified settings
playAudio "ballSound_trigger", url, "oneshot", 1

/// This MiniScript randomly selects a ball kick sound to play from a list of 10 options.
r = round(rnd*9)
if r == 0 then
    playAudio "ballSound_trigger", "https://metaverse.web3done.com/my-content/sounds/ballkick/ballkick1.mp3", "oneshot", 1
else if r == 1 then
    playAudio "ballSound_trigger", "https://metaverse.web3done.com/my-content/sounds/ballkick/ballkick2.mp3", "oneshot", 1
else if r == 2 then
    playAudio "ballSound_trigger", "https://metaverse.web3done.com/my-content/sounds/ballkick/ballkick3.mp3", "oneshot", 1
else if r == 3 then
    playAudio "ballSound_trigger", "https://metaverse.web3done.com/my-content/sounds/ballkick/ballkick4.mp3", "oneshot", 1
else if r == 4 then
    playAudio "ballSound_trigger", "https://metaverse.web3done.com/my-content/sounds/ballkick/ballkick5.mp3", "oneshot", 1
else if r == 5 then
    playAudio "ballSound_trigger", "https://metaverse.web3done.com/my-content/sounds/ballkick/ballkick6.mp3", "oneshot", 1
else if r == 6 then
    playAudio "ballSound_trigger", "https://metaverse.web3done.com/my-content/sounds/ballkick/ballkick7.mp3", "oneshot", 1
else if r == 7 then
    playAudio "ballSound_trigger", "https://metaverse.web3done.com/my-content/sounds/ballkick/ballkick8.mp3", "oneshot", 1
else if r == 8 then
    playAudio "ballSound_trigger", "https://metaverse.web3done.com/my-content/sounds/ballkick/ballkick9.mp3", "oneshot", 1
else if r == 9 then
    playAudio "ballSound_trigger", "https://metaverse.web3done.com/my-content/sounds/ballkick/ballkick10.mp3", "oneshot", 1
end if
  
  /// This MiniScript randomly selects a ball kick sound to play from a list of 10 options.
  // Generate a random number between 0 and 9
  r = round(rnd*9)
  
  // Construct the URL for the audio file with the random number appended
  url = "https://metaverse.web3done.com/my-content/sounds/ballkick/ballkick" + r + ".mp3"
  
  // Play the audio file with the specified settings
  // playAudio function parameters:
  // - "ballSound_trigger": The identifier for the audio trigger
  // - url: The URL of the audio file to be played
  // - "oneshot": The playback mode, indicating the audio should be played once
  // - 1: The volume level of the audio playback
  playAudio "ballSound_trigger", url, "oneshot", 1


  /// This MiniScript randomly selects a ball kick sound to play from a list of 10 options.
r = round(rnd*9)

// Construct the URL for the audio file with the random number appended
url = "https://metaverse.web3done.com/my-content/sounds/ballkick/ballkick" + (r + 1) + ".mp3"

// Play the audio file with the specified settings
// playAudio function parameters:
// - "ballSound_trigger": The identifier for the audio trigger
// - url: The URL of the audio file to be played
// - "oneshot": The playback mode, indicating the audio should be played once
// - 1: The volume level of the audio playback
playAudio "ballSound_trigger", url, "oneshot", 1
