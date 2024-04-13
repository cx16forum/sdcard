
This is a utility for the Commander X16 to exercise the FMxxx BASIC commands.

Written by voidstar, September 2023.

*** NOTE ABOUT BASLOAD **********************
The BAS file is a text file intended to be loaded using BASLOAD on the X16.
BASLOAD allows programming BASIC without the need for line numbers, and also
features the ability to specify symbolic branch names.  BASLOAD determines
line numbers automatically as it parses the code and tokenizes it into the
Commander X16 BASIC OS.

BASLOAD is available at the commanderx16 forum downloads section.
*********************************************

The X16AUDIOFM program is intended to help construct simple sound effects 
to be used in other BASIC programs.

Specifically, it helps with the FMFREQ, FMNOTE, and FMDRUM commands.  
Along with corresponding support commands of FMVOL, FMINST, and FMPAN.

This program is not intended to help with FMCHORD and FMPLAY commands.

For the BASIC commands, <CH> is ranged 0 to 7 (for 8 total channels).

FMFREQ <CH>,<FREQ>             Freq 17 to 4434
FMNOTE <CH>,<OCTAVE & NOTE>    Octave 0-7, note 0 to C (hex)
FMDRUM <CH>,<DRUM INSTR>       Drum instruments 25 to 87 (MIDI precussion)

FMVOL  <CH>,<VOL>              Volume 0 to 63
FMINST <CH>,<INST>             Instruments 0 to 162
FMPAN  <CH>,<FADE>             1 = Left, 2 = Right, 3 = Both

Each of the 8 channels can be toggled as ACTIVE or INACTIVE.  ACTIVE channels
will have a color, while INACTIVE channels will be BLACK.

Channels are selected by pressing numeric keys 1-8.  When a channel is
selected, it automatically is set to ACTIVE.  Press T to toggle it back
to INACTIVE.

PLAY (SPACEBAR): Each channel is played in sequence per the specified
settings.  A small "sleep" delay can be specified in-between each
channel.  This is because some instruments have audio effects that may
linger longer than others.  Or if you want to stagger the start of
certain audio effects.  This SLEEP delay can be 0 if no delay is needed.

AUTO MODE: Automatically press SPACE and cycle through all the active channels.
This is effectively like holding down SPACEBAR.  However, keep in mind that
you can manipulate channel settings during AUTO MODE, so you can get
immediate feedback on the effect of that setting change.

INVERT: You can INVERT the set of ACTIVE channels by pressing I.  This
is mainly used to help quickly test a single channel.  That is, if you
have many channels ACTIVE, you can INVERT them all off.  Then select
the single channel you want to focus on testing.

COPY CHANNEL: Use this option to copy the values of another channel
over to the currently selected channel.   If you have a particular
instrument setting or frequency, this can be used to quickly
set other channels to that same initial value.  It may then be faster
to adjust the other channel from those settings, rather than
from the initial default settings.

SAVE/LOAD: You can save all the channel settings to a user specified
filename.  The format is essentially a CSV text file of all the pertinent
program variables, so it can be manipulated easily in other editors
(like X16EDIT) if so desired.

EXPORT: The EXPORT setting creates a BASIC program that is the equivalent 
to all the current program settings.  This is not a tokenized version of 
the BASIC program, but is a regular text file.  It can be loaded into the 
x16 emulator using the "-bas" command line argument (or just copy and paste it).
From there you can use SAVE to store it in the tokenized form.

