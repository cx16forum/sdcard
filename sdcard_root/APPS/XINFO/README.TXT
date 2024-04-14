XINFO for the Commander X16

For Public Domain - by v* Nov 2023

As a convention, proposing XINFO file extensions be .NFO
(but they are text files, not tokenized files of any sort)

XINFO reads and displays these textfile in a fashion that is appropraite to the current screen text mode resolution.
XINFO is somewhat similar to "man" command in Linux or the Lynx web text-based browser, but notable differences tailored to the X16 system.

During each page of text, a "pause menu" appears at the bottom.  During this pause menu, you can do a few things:

SPACEBAR will continue (if the pause menu says "more"; otherwise if the menu says "stop" then SPACEBAR will start over from the top)

[ ]  can be used to change text mode resolution (in case XINFO was started in a mode that isn't suitable to the output screen being used or the amount of information content being read)

UP/DOWN or PGUP/PGDN can be used to cycle through any available links on the current page.  An asterick appears next to the currently selected link.

ESC to exit.

Or use the mouse to select the highlighted links.

NOTE: Next to the pause menu is a number that corresponds to the current page.  This can help show if you are the beginning ("page 1") or if you need to exit, it can help as a reminder on what page you were on if you need to return to that page in the future.



Supported markup tokens:

<CONTROL:xx>
<CON:xx>

xx is a two character hex value that corresponds to the PETSCII codes as presented here:  https://sta.c64.org/cbm64pet.html
Only a few codes are supported, mainly ENTER and FOREGROUND COLOR changes:

0D = ENTER/RETURN

FF = Disable word wrap for current line
FE = Line divider (dashes to end of current line)
FD = Force menu (does not apply when linking to a tag)
(used to provide a PAUSE between major descriptions and the rest of content, like for examples or supporting information)

05 = WHITE
1C = RED
1E = GREEN
1F = BLUE
81 = ORANGE
90 = BLACK
95 = BROWN
96 = PINK
97 = DARK GREY
98 = GREY
99 = LIGHT GREEN
9A = LIGHT BLUE
9B = LIGHT GREY
9C = PURPLE
9E = YELLOW
9F = CYAN



<XLINK:target,title>
<XLI:target,title>

External link.  Target can be relative or absolute path (relative to the CWD where XINFO was ran).  Linked to 80 total characters including filename.

Title is shown in reverse during XINFO runtime, as a left-mouse-clickable hyperlink to the specified target.



<TLINK:tag,title>
<TLI:tag,title>

Tag link.  This is similar to external link, but the TAG must be within the same file that is already opened.  This is typically as a "go back to top" feature, but can also be used to quickly go to various topics within the same file.  Tag is the name of a specified tag.   Title is what is shown to users that can be clicked on.


<TAG>

Defines a target tag to be used in TLINK commands.


COMMAND LINE ARGUMENTS:
XINFO <filename> [top] [bottom] [left] [right] [fn] [dev] [sub]

If no filename is specified, then INDEX.NFO is the default.

As a cc65 built project, command line arguments are passed via a REM during the RUN.  Like this:
LOAD"XINFO.PRG"
RUN:REM INTRO.X16 2 3 4 6

If no margins are specified, the default for each margin is 2.

And to clarify, if you just do this:
LOAD"XINFO.PRG"
RUN

That works also and XINFO will look for INDEX.X16 in the current folder and start with that.

If one margin is specified, then they all need to be specified.

The same goes for the FN and DEVICE parameters: to specify any of them, you must specify all of them.
The default FN/DEVICE parameters are like this (FN=1, DEV=8, SUB=6):
LOAD"XINFO.PRG"
RUN:REM INTRO.X16 2 2 2 2 1 8 6


LIMITATIONS:

To bound the RAM usage, XINFO does not open the entire specified file at once.  It parses "about a screen worths" of content at a time.  Within that content, the following limits apply:

- up to 30 "visible" links (XLINK or TLINK)
- Tag target can be up to 40 characters
- External link targets can be to 80 characters

"visible" links is confusing.  If the user is using 80x60 they can have more links visible at a time than at smaller resolutions.  You'll need to arrange the .X16 content such that, in the worse case at 80x60, only 30 links can be presented at a time.  Each link counts, even if they go to the same target.

This is all adjustable in the .c source code, just depends on how much RAM to be reserved upfront.

