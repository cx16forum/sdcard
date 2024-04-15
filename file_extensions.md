# File Extensions

This is a draft RFC for a canonical set of file extens and text file encoding metadata. 

## Extensions 

.PRG for binary program files (BASIC, assembled, compiled)
.TXT for text files
.PET for PETSCII text files
.ISO for ISO text files (ASCII ISO
.ANS for ANSI text files (ASCII CP437)

.BAS for text encoded BASIC files.
.B2 for line numbered, text encoded BASIC files
.BL for BASLOAD files

## Encoding

THe X16 has 11 built-in character sets (although roughly half of them are "thin" 
variants of the same glyphs), and there are 3 common options for line endings
in text files.

So we are proposing the following standard to describe the encoding of a text file:

`## [tool] {PET|PETSCII|ASCII} [CRLF|CR|LF] [Ex]`

For example: `## BASLOAD ASCII CRLF` 

* Start the line with a comment character and the compiler or assembler used for this code.
  * `## BASLOAD` for
  * REM BASIC2
  * ; ca65
  * // cc65
  * ; prog8
  * Plain Text: Do not prefix the line; leave this portion off.
* Character Encoding
  * PET or PETSCII (uppper case/graphics)
  * pet or petscii (upper/lower case mode)
  * ASCII (ASCII encoding, includes ISO and ANSI modes)
    * ISO (ISO-8859-15, or character set 1)
    * CP437 (uses CP437 character set, as seen on IBM PC)
    * ANSI (CP437 with ANSI escape codes)
* Line Ending
  * CR (default)
  * CRLF (for files created on Windows. LF is ignored by default)
  * LF (for files created on Linux)
* E followed by the character set.
  * E1  Standard ISO character set
  * E2  PETSCII upper/graphic
  * e3  PET upper/lower
  * E4  PETSCII upper/graphic (thin)
  * e5  PET upper/lower (thin)
  * E6  ISO (thin)
  * E7  CP437 (aka ANSI or IBM PC Extended ASCII)
  * E8  Cyrillic ISO
  * E9  Cyrillic ISO (thin)
  * EA  Eastern Latin ISO 
  * EB  Eastern ISO (thin) (since r47)

So a complete encoding tag for BASLOAD might look like

```
## BASLOAD PETSCII CRLF E2 - created on Commander
; 64TASS ASCII CRLF E7 - created on Windows
// cc65 ISO LF - created on Linux
; prog8 ASCII CRLF E1

```
