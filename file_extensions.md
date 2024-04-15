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

`## [compiler|assembler] {PET|PETSCII|ISO|ASCII} [CRLF|CR|LF] [Ex]`

* Begin the line with ##. This signifies a comment in BASLOAD. For other
  programming languages, use the correct comment character: ;, //, etc
* PET for PETSCII, pet (lower case) for PETSCII upper/lower case, and ISO or ASCII for ISO or ASCII.
  (ISO and ASCII are synonomous in this context.)
* CRLF, CR, or LF line endings.
  * If not stated, assume CR and ignore LF characters.
* E followed by the character set
  * E1  Standard ISO character set
  * E2       PETSCII upper/graphic
  * e3       PET upper/lower
  * E4       PETSCII upper/graphic (thin)
  * e5       PET upper/lower (thin)
  * e6       ISO (thin)
  * E7  CP437, ANSI, IBM Extended ASCII
  * E8  Cyrillic ISO
  * E9  Cyrillic ISO (thin)
  * EA  Eastern Latin ISO 
  * EB  Eastern ISO (thin) (since r47)

So a complete encoding tag for BASLOAD might look like

```
## BASLOAD PETSCII CRLF E2 - created on Commander
; 64TASS ASCII CRLF E7 - created on Windows
// cc65 ISO LF - created on Linux
```
