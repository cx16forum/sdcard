

As the mythical Cyclops only had one eye, this simulation of the minimal ICU system, as described in the Motorola MC14500B Handbook, only has a 1 bit data bus! This seems incredible to us today, but was used as an industrial controller, albeit for a short time, as rapid development and price reductions of digital technologies soon made this obsolete. 

As a curiosity though, it's simple enough to make an interesting project for this hobbyist to model on an 8-bit system.

Upon running, you will be presented with the opportunity to load either the default program, one of the examples, or one that you have written. The built in assembler will process the source code and load it into the 256 bytes of RAM available to the simulation, assuming that no errors are found. In this system, RAM is only for program code. That is to say, the ICU cannot write to RAM. There are a number of UI controls and objects, many mimic LEDS, to give an indication of how fast the system 'clock' (merely a program loop, with set delays) is running and to give a graphical indication of the program counter and current data in RAM. There is a RUN/HALT 'switch', which will start out in the HALT position, a 'potentiometer' that controls the 'system clock' and a single step 'push button'. There is also an 8 position 'DIP' switch, which is how the 8, 1-bit inputs are set. Write only OUTPUT LEDS indicate data written out by the system. There are also 7 read/write SCRATCHPAD bits available for use in logical calculations. Lastly, there are two other LEDS representing the state of the ICU RESULT REGISTER (or accumulator) and the WRITE flag, these are helpful for debugging along with the program counter and memory display LEDS. Newly added are the LEDs for IEN and OEN, which give a visual indication for whether or not I/O is enabled or disabled.

The speed potentiometer has 4 settings. Slow being about 25 instructions per second, the next fastest setting is about 30 instructions per second, then about 40 IPS and finally about 80 IPS, each speed increase sacrifices some display info. It's a shame to disable the some of the LEDs in order to get program execution to a barely acceptable rate, since the 'blinky lights' is what gives this simulation part of the 'feel' of the early days of early micro-processing!

The currently loaded program filename is displayed in the RAM 'chip' (LOL!). Clicking on it will allow a new program to be loaded. The RESET push button will indeed reset the system, erasing memory, but really serves no useful purpose.

So, what is this program good for? Not much really, other than being a fun project. There are videos on YouTube (see Usagi Electric), which were the inspiration for this program and there is a 'maker' project available on Tindie, to build your own, as well as a companion book available on Amazon. There is also at least one other computer simulation available for 32/64 bit processors, which models the 'Tindie' project and sacrifices one scratchpad bit, for a timer. 

The 'ICs' and traces shown are very, very loosely based on the simple block diagram in the handbook and were added mainly for...amusement and visual interest.


Assembler

There is a 'ghetto' version assembler in the MC14500B simulator. The program will ask for a filename, open the file and assemble it to memory. The mnemonics for the 16 opcodes are:

NOPO	
LD
LDC
AND
ANDC
OR
ORC
XNOR
STO
STOC
IEN
OEN
JMP
RTN
SKZ
NOPF

RTN is included here for completeness, but is not supported on this system or by this assembler, since there is no stack to hold the return address. JMP is supported, but all jumps go to address 0. This, plus the SKZ command is one way to skip blocks of code. Speaking of SKZ, it takes no argument or address, but for this assembler, a dummy argument must be used, zero (0), same as for JMP.

The 1st 8 I/O adresses (0-7) are shared between, read only inputs:

I1
I2
I3
I4
I5
I6
I7
I8

and write only outputs:

O0
O1
O2
O3
O4
O5
O6
O7

The remaining addreses (8-14) are the read/write scratchpad:

S0
S1
S2
S3
S4
S5
S6

And lastly address 15 is the result register, or accumulator:

RS.

The default filename (blink.src) shows the default I/O mnemonics, set equal to themselves. It is possible to define more descriptive names for the I/O addresses in the source code, simply change the name between the # and = sign, the assembler will match this to the actual name and add the associated numerical address to the opcodes throughout the program. These names are limited to a maximum of 10 characters and these definitions, either the default or your own definitions, must occur at the beginning of the source code. After pressing return for the filename, the file will be loaded into the X16EDIT HIRAM version (by Stefan Jakobsson), available in the DOWNLOADS section of X16Forum.com, if that program has been loaded into memory previously by the user. The file may be edited then by the user, or if no edits are desired, exitting the editor (ctrl-x), will cause that file to be assembled to memory. I have configured X16edit to only use RAM banks 2 and 3, which should be plenty of room!

There must me no empty lines and full line comments, preceded by a semicolon, are only permitted at the beginning of a file. Comments may be added, after instructions (after the argument actually), but there must be at least one space between the comment and the characters preceding it. Line lengths must not exceed 255 characters. Instructions must start at the beginning of a line and there must be 1 space separating the instruction and it's argument.

I call this a 'ghetto' assembler. In truth, it's not quite as 'ghetto' as it once was! It's a simple one pass assembler, but after spending multiple days trying to fix a 'problem' with the assembler, that was actually a problem with the code, I have added some rudimentary error flagging to let you know that you've got some unresolved instructions or addresses in your source code. It will stop assembly and you will need to correct your source code, reload/reassemble.

The simulated system only contains 256 bytes of memory, therefore, programs can only contain 256 instructions....so, restrain yourself LOL!


Kill the Bit

This is a 'game' (not my definition LOL) that was originally written for the Altair 8800 back in 1975. The 'bit' climbs up the output LEDs and the player tries to 'kill' it, by clicking the corresponding input switch, at exactly the right time. If you are timing is not quite right, the bit stays on, if you are too much too early or late, another bit turns on. Try not to get too excited. Scorekeeping? Set a stopwatch and see how long it takes you to eliminate all of the 'bits'! The simulator is really not quite fast enough to make this much of a challenge, once you get a feel for it. Games have changed a bit over the preceding decades! There two versions of this game included, one is code that was adapted from code written by Y. Veremenko, available on his Github page. This version allows a 'bit' to be killed in any of the 6 output bits by using the appropriate input switch. The other version, which was itself adapted from Veremenko's code, only allows the bit to be killed from output O0, using input switch I1, actaully appears to run slightly faster, not really noticeably though, because it's only checking one input per loop. 


Program notes.

Why did I do this? As a retired hobbyist, programming is an end to itself! I write code for whatever strikes my fancy, as long as it's something that I feel I can accomplish....no Guru I!
After watching the breadboard videos on Youtube, thinking about undertaking a similar project...although I'm not a 'maker' per se, I ran across the Tindie project, but was unable to purchase, as the project creator was....on vacation, presumably. This was the moment of inspiration. Like all of my recent projects, Prog8 was used to create this program.


