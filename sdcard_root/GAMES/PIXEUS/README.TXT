Pixeus - v0.1.0-alpha-2
Game design and code: Mark Wiedmann
Music: Crisps

This is an alpha release version 2 of Pixeus, a lite Metroidvania/platformer for the Commander X16. It is written entirely in C by Mark Wiedmann and compiled with cc65 other than:
- The awesome zsound library from ZeroByteOrg (https://github.com/ZeroByteOrg/zsound)
- A waitforjiffy routine

Q: Which emulator to use?
A: r41 ("Marrakech") for now.
I haven't tried this on actual X16 hardware. It has only been tested on the official emulator. It works great on r41 ("Marrakech") and a bit less so on r42 ("Cambridge") as r42 (currently) seems to not perform as well as r41 (at least for me) but I imagine this will improve. Anyway, for best results as of late March 2023, the r41 emulator performs best for Pixeus.

Q: How to run this?
- Unzip somewhere
- Open a terminal and CD (change directory) into the folder where the "pixeus.prg" file is located.
  NOTE: You must run the emulator from this directory because the game tries to load the assets from the current directory.
- Run the emulator with the options  -prg pixeus.prg -run
- Example: pathToEmulator\x16emu -prg pixeus.prg -run

Q: How to report issues/suggestions?
A: Discord: I'm on the Commander X16 Discord as Mark-BugSlayer#1409
   Forums: I'm on the X16 forums as mwiedmann

Q: Will you release/open source the code?
A: I will publish the code at some point with a "for personal use" type of license. This was done in a very iterative fashion as I was learning how to code on the CX16 so I need to "tidy up" a bit.

Known Issues/Pending Work
- Still work to do on the sound effects (the laser and hit sounds for instance). Would like to add some more as well.
- Sound effects sometimes freakout and play static. I'm using zsound and it seems to have some issues? Looking into this.
- The music stutters if the game lags and there are some slight pauses here and there.
  I'm unsure how much of this is due to the emulator or just my game being a hog and the music system not having enough time to catch up.
  On r41 on my machine it still sounds good. I'll be curious to see how (if?) it runs on actual hardware.
- There have been level changes that probably haven't all been tested (still alpha!)
- General balance issues with enemies
- Jumping and some other "feel" things will be tweaked as dev continues
