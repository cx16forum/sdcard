Munch Mania -- inspired by Munch Man on the TI-99.

1. This is not a direct port of Munch Man. While it shares a lot of
similarities with that game, this is not a one-to-one reproduction
of that game. So, certain mechanics and (most definitely) sound
effects will deviate from the original.

2. There are 20 unique levels, 11 based on variants from the original
Munch Man and 9 based on variants from the original, 1982 Winter CES
demo.

3. There are 40 levels total. Can you make it all the way to the end?

4. Bonus lives are awarded every 20,000 points -- to a max of 10.

5. Use arrow keys/d-pad to move, and enter (start on controller) to
pause/unpause the game. If Joystick1 is present, it will be used.
Otherwise, the keyboard is used. Depending on your controller, you
may find that the keyboard is much easier to control/use -- as was
the case with the original TI-99 version.

6. To run, extract into a directory in which x16emu can run, then
launch with:

    x16emu -prg MUNCH.PRG -run -joy1

Or, launch the emulator then enter:
    LOAD"MUNCH.PRG"
    RUN

7. Huge, huge shout-out to Matt Heffernan -- without his exceptional
tutorials and code samples, none of this could have been possible.


Changes:
    V1.3
        * Fixed joystick routines. If Joystick 1 is present, it
          will be used. Otherwise, keyboard is used.
    V1.2
        * Enemies now react to the player. They will pursue the
          player when they're nearby and hostile. They will flee the
          player when nearby and a power-up is active (i.e., when the
          enemies are vulnerable).
        * Power-up collision detection has been improved. Previously, 
          the player had to be completely over the power-up to eat
          it. This meant the power-ups weren't always consumed when it
          seemed like they should be. This was particularly
          frustrating when racing enemies to the power-up, or when it
          was the last thing in the level to eat.
        * Power-ups stay active for a bit longer now (due to the
          enemies being more dangerous).
        * Randomization routines have been changed to better prevent
          enemies from falling into lock-step with one another for
          extended periods of time (i.e., occupying the same location
          on screen while moving along the same path). Lock-step can
          still occur, but the duration should be much shorter.
        * Only MUNCH.PRG changed; you can simply copy that into your
          game directory (to avoid overwritng your HISCORE.BIN).

    V1.1
        * Fixed an order of operations issue where if you finished
          a level just as an enemy touched you, you'd die, and the
          moment you moved after respawning, the level would be
          over. Now, level completion is checked before enemy
          collision.
        * Added version number on load screen
        * Modified load screen text to mention both enter and start
        * Only MUNCH.PRG changed; you can simply copy that into your
          game directory (to avoid overwritng your HISCORE.BIN).


Potential Future Work:
* None planned
