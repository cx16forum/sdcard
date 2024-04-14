
ASSEMBLER - PROG8 COMPILED ASSEMBLER BY DESERTFISH

LOAD "CX16ASSEMBLER.PRG"
RUN

ENTER COMMAND: x hello.asm

"x" WILL PERFORM ALL THE REQUIRED STEPS TO
ASSEMBLE THE .ASM INTO AN OBJECT FILE AND
LINK THE ASSEMBLED PRODUCT INTO A RUNNABLE .PRG

Other examples:

sample.asm
mathlibexample.asm

To run these exampels from outside of the CX16ASSEMBLER
environment, load the built binary like this:

LOAD "HELLO",8,1

NOTE: The 8,1 is important, since this will parse the 
header of the binary to know where to load it into RAM.
This location is also where your SYS call will be used
to run the program (e.g. SYS $9000, SYS $A000, SYS $0400, etc).




