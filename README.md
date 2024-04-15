
# Commander X16 SD Card Starter Kit

This is the repository for support of the Commander X16's "starter kit." This 
includes a variety of programs to get you started on your X16.

In this kit, you'll find games, music programs, utility programs, and more. 

## Installation

If you have a previous relesae of the SD card image, we suggest
backing up and erasing your card first. 

Then, simply unzip to your SD card. FM.PRG and SHELL.PRG can
be in the root directory of your card, or they can be placed
in a subdirectory named SD or something similar.

## Use

* Boot your X16 with the SD card installed. Press F7 to view
  the directory.
* Type `/FM.PRG` and press RETURN (or Enter) to load the File Manager.
* Type `RUN` and press RETURN to start the file manager.

Or...

Press the F7 key to see a listing of your files and directories.
Entries with `DIR` on the right are directories.

Type `@CD:directory_name` to switch to a directory. For example,
`@CD:DOCS` or `@CD:APPS`. 

You can also "cheat" by moving the cursor up to a directory in
the list and typing `@CD:` at the start of the line, then
using the DEL key on the keyboard to suck in the directory name
until you have removed the quote, like this:

`@CD:DEMOS"         DIR`

If a directory has an `AUTOBOOT.X16` file, you can type `BOOT` to start the 
program. Otherwise, look for a `.PRG` file that seems correct.

## Dos Wedge

The @ symbol and the > symbol, when used at the start of the line,
are known as the DOS Wedge. 

Back in the PET days, the Wedge was an extra utility you had to load each
time, and the > symbol activated Wedge commands. You can still use >
instead of @. Go ahead, give it a try: `>$`

The DOS wedge allows you to issue quick commands from BASIC with the > or @
symbol.

| Command | Action |
|-|-|
| `/<filename>` | Load a BASIC program into RAM |
| `%<filename>` | Load a machine language program into RAM (like `,8,1`) |
| `↑<filename>` | Load a BASIC program into RAM and then unconditionally run it |
| `←<filename>` | Save a BASIC program to disk |
| `@` | Display (and clear) the disk drive status |
| `@$` | Display the disk directory without overwriting the BASIC program in memory |
| `@#<device number>` | Change default DOS device |
| `@<command>` | Execute a disk drive command (e.g. `@S0:<filename>`) |
| `><command>` | Execute a disk drive command (e.g. `>CD:<dir>`) |

We'll include this listing on the SD Card, for your convenience.
  
## Standards

If a program has multiple executables, we may include an AUTOBOOT.X16 file in
the program directory. Just type `BOOT` to automatically start the correct
executable, in that case.

### Filename Extensions

* Tokenized BASIC and machine language binaries: `.PRG`
* Plain-text, line numbered BASIC programs: `.BAS`
* BASLOAD compatible BASIC programs: `.BL`
  * The first line should indicate ISO mode and line endings:
* Text files with PETSCII graphics: `.PET`

You can also hint at line endings and encoding by adding an encoding string at
the top of your file:

```
BASLOAD source code
## BASLOAD PET CR   (Commander)
## BASLOAD ISO LF   (Linux)
## BASLOAD ISO CRLF (DOS/Windows)

Plain text files
## ANSI CRLF        (DOS/Windows)
## ANSI LF          (invalid)
## ISO CRLF         (DOS/Windows)
## ISO LF           (Linux)
## PET CR           (Commander/Commodore)
```

Note that `ANSI LF` should never be used, since the ANSI terminal standard
requires CRLF to start a new line.

So why have BASLOAD at the start of a BASLOAD source file?

One of my pet peeves when browsing GitHub is to see a repository with no
information on how to build a program and what toolchain is needed. However,
someone can do a web search for BASLOAD, and the first verbatim link goes to our
forums, where Stefan has posted an early beta of his program.



## Submissions

We may ask you for permission to include your software in the collection.
If you accept, you will be granting us the right to distribute your
software on the same terms as listed above. You will still own your
full Copyright, with all other rights reserved by you.

To be considered for inclusion, programs should be uploaded to the 
[Commander X16 forum](https://cx16forum.com) and meet the technical
requirements listed below.

In addition, programs should demonstrate one or more of the X16's features
in a useful, entertaining, or interesting way. 

Complete, arcade-quality video games are likely to be included, as 
are super useful utility programs, such as the included file manager
or CLI Shell. We are not likely to include a 2-frame PETSCII
animation or a picture of your cat.

## Technical Requirements

Software submitted to this archive must meet certain performance
and reliability requirements. 

* The program must operate on a 65C02 or 65C816 CPU.
* The program must be usable on a composite monitor.
* The program must operate (not crash) if the Yamaha FM synthesizer
  is removed from the host computer.

In some cases, composite mode or operating without an FM chip
will offer reduced capabilities. For example, we don't expect a
music program to play all of the available channels if the FM chip
is not present.

If you're not sure how to implement composite-safe video and
FM-safe sound, please join us on the forums or the community 
Discord at https://www.commanderx16.com

## Legal Requirements

As always, we can only accept software that is _free to use_ and 
distribute. You'll retain the full Copyright of your work, but you
will be asked to grant us a license to distribute your work for
the purposes of including it with a new Commander X16 computer.
