.include "cbm_kernal.inc"
; tail:    skip lines in text file
;
; entry:         A  = LFN of already-open file to read from
;                XY = number of newlines to skip (low in X, high in Y)
;
; exit:          C  = set if unable to read that many newlines
;
; When called with the number n in XY, this will leave the file ready to be
; read at the first byte after the nth newline. If EOF is encountered before n
; newlines are read, the carry bit will be set on return. However, if the nth
; newline is the last byte in the file, carry will be clear even though there's
; nothing left to read. The calling program therefore always needs to check ST
; before trying to read further, and may ignore carry if it doesn't matter that
; there weren't as many newlines as requested.

                high = $22

.org $0650

tail:           cpx #$00               ; nothing to do if count is 0
                bne notzero
                cpy #$00
                beq done

; To streamline the countdown loop, the high byte is decremented when the low
; byte hits 0 instead of $ff. To make the math work, the initial value of the
; high byte needs to be incremented by one – but only if the low byte is not 0.
; if we get here, the low byte is 0, so we decrement the high byte to cancel
; out the upcoming increment.

                dey

notzero:        iny
                sty high
                phx
                tax
                jsr CHKIN
                ply

loop:           jsr CHRIN
                cmp #$0d
                bne next
                dey
                bne next
                dec high
                beq done

next:           jsr READST
                and #$40
                beq loop

err:            jsr CLRCHN
                sec
                rts

done:           jsr CLRCHN
                clc
                rts
