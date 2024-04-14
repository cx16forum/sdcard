; Make it rain PETSCII, Matrix-style, on the CX16
; Mark J. Reed, 2023

%import math
%import palette
%import syslib
%import textio
%zeropage basicsafe

main {
    ubyte[] colors = 15 downto 0
    const ubyte speed_range = 4

    ubyte[80] bottom
    ubyte[80] speed
    ubyte width, height
    ubyte i, j, j1, j2, dj
    ubyte key, color, ticks, count

    asmsub get_screen() {
        %asm{{
              jsr cbm.SCREEN
              stx p8v_width
              sty p8v_height
              lda #$00
              sta $d020
              sta $d021
        }}
    }

    sub greenscale() {
        for i in 0 to 14 {
           palette.set_color(i, (i as uword)<<4)
        }
        palette.set_color(15, $ffff)
    }

    sub start() {
        void cx16.clock_get_date_time()
        math.rndseed(cx16.r2, cx16.r1)
        greenscale()
        get_screen()
        for i in 0 to width - 1 {
            bottom[i] = 0
        }
        ticks = 0
        key = cbm.GETIN()
        while key == 0 {
           for i in 0 to width - 1 {
               if bottom[i] and ticks % speed_range < speed[i] {
                   j1 = bottom[i]
                   if j1 <= height {
                       txt.setchr(i, j1-1, math.rnd()>>1)
                       txt.setclr(i, j1-1, 1)
                   } else {
                       j1 = height
                   }
                   j2 = j1 - len(colors) + 1
                   if j2 < 1 or j2 >= 96 {
                      j2 = 1
                   }

                   for j in j2 to j1 {
                       dj = bottom[i] - j
                       if dj >= 128 {
                           dj = 0
                       }
                       if dj >= len(colors) {
                           dj = len(colors) - 1
                       }
                       txt.setclr(i, j-1, colors[dj])
                   }
                   bottom[i] = bottom[i] + 1
                   if bottom[i] >= height + len(colors) {
                       bottom[i] = 0
                   }
               }
           }
           if math.rnd() < 128 {
               count = 0
               for i in 0 to width -1 {
                   if bottom[i] == 0 { count += 1 }
               }
               if count {
                   i = math.rnd() % count
                   for j in 0 to width - 1 {
                       if bottom[j] == 0 {
                           if i==0 {
                               i = j
                               break
                           } else {
                               i -= 1
                           }
                       }
                   }
                   bottom[i] = 1
                   speed[i] = math.rnd() % speed_range + 1
               }
           }
           sys.wait(2)
           key = cbm.GETIN()
           ticks += 1
        }
        palette.set_default16()
        txt.color(5)
        txt.clear_screen()
    }
}
