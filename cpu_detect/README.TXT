ISO/CRLF

This version of AUTOBOOT.X16 is customized with a CPU detection routine. 
This allows you to use separate binaries for 65C816 and 65C02 versions of
your program, if needed.

To use:

1. Name your 65C02 binary `PROG-6502.PRG`.
2. Name your 65C816 binary `PROG-65816.PRG`.
3. Place the AUTOBOOT.X16 and the PRG files into a directory.
4. @CD into the directory and type `BOOT` to launch the program.

BASLOAD (.BL) files are included, for your convenience. 

The actual detection routine is as follows:
  0400 SEC
  0401 REP #03
  0403 RTS

When the BASIC program calls this routine with SYS $400, the CPU proxy variables
at $30D-$30F will be set to the values of the CPU registers. $30F gets teh CPU
flags. The Carry flag is bit 0, which has the value 1 when set.

To detect the CPU, you can now SYS the routine and read the flags:
SYS $400
CPU = PEEK($30F) AND 1

The rest of the program runs the new program by printing the DOS Wedge Load (/),
filename, and the RUN commands. It then injects two CR symbols into the keyboard
buffer.

